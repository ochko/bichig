class OtfLookupClass < ActiveRecord::Base
  FLAGS = { :reserve => 0, :sub => -1, :by => 1}
  belongs_to :otf_lookup
  belongs_to :otf_class
  belongs_to :otf_lookup_row
  
  def after_save
    self.otf_lookup.touch
  end
  
  def substitute?
    self.replace_flag == FLAGS[:sub]
  end
  def by?
    self.replace_flag == FLAGS[:by]
  end
  def replace_by_this!
    self.update_attribute(:replace_flag, FLAGS[:by])
  end
  def kind
    if substitute?
      'sub'
    elsif by?
      'by'
    else
      'reserve'
    end
  end

  def to_s
    output = ""
    if otf_class.name
      output << otf_class.name
    else
      output << otf_class.otf_glyphs.map{|g| g.name}.join(" ")
      if otf_class.otf_glyphs.size > 1
        output = "[#{output}]"
      end
    end
    if substitute?
      output << "'"
    end
    output    
  end

  def self.build(row, group_body, position = 0)
    lookup_class = self.new(:otf_lookup_row => row,
                            :otf_lookup => row.lookup,
                            :position => position)
    if group_body[:replaceable_glyphs]
      lookup_class.replace_flag = FLAGS[:sub]
      group_elements = group_body[:replaceable_glyphs][0]
    else
      lookup_class.replace_flag = FLAGS[:reserve]
      group_elements = group_body[:glyphs][0]
    end
    
    
    if group_elements.instance_of?(String) && /^@/.match(group_elements)
      klass = OtfClass.find_by_name(group_elements)
      lookup_class.otf_class = klass
    else
      # Anonymous OtfClass
      klass = row.lookup.font.classes.create(:name => nil)
      position = 0
      group_elements.each do |name|
        position += 1024
        glyph = row.lookup.font.glyphs.find_or_create_by_name(name)
        ClassGlyph.create(:otf_class => klass, 
                          :otf_glyph => glyph,
                          :position => position)
      end
      lookup_class.otf_class = klass
    end
    debugger unless lookup_class.otf_class
    lookup_class.save
    lookup_class
  end

end
