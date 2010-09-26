class OtfFeature < ActiveRecord::Base
  belongs_to :open_type_font
  belongs_to :parent, :class_name => self.name
  has_many :childs, :foreign_key => 'parent_id', :class_name => self.name
  has_many :lookups, :foreign_key => 'feature_id', :class_name => OtfLookup.name, :dependent => :destroy
  
  def before_save
    self.open_type_font = parent.open_type_font if parent
  end

  def to_s
    output = "feature #{name} {\n"
    output << "\tscript #{script};\n" if script
    output << childs.map{|child| "\tfeature #{child.name};\n"}.join

    if lookups.size == 1 && (lookups.first).name.eql?(self.name)
      output << "\tlookupflag #{lookups.first.flag};\n" if lookups.first.flag
      output << lookups.first.otf_lookup_rows.join
      output << Language.all.map{|lang| "\tlanguage #{lang.code};\n"; }.join
    else
      output << lookups.find_all_by_language_id(0).join
      Language.all.each do |lang|
        output << "\tlanguage #{lang.code} exclude_dflt;\n";
        lookups.find_all_by_language_id(lang.id).each do |lookup|
          output << "\t\tlookup #{lookup.name};\n"
        end
      end
    end
    output += "} #{name};\n"
  end
end
