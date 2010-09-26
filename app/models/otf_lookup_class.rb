class OtfLookupClass < ActiveRecord::Base
  FLAGS = { :reserve => 0, :sub => -1, :by => 1}
  belongs_to :otf_lookup
  belongs_to :otf_class
  belongs_to :otf_lookup_row
  
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
    end
  end

  def self.build(row, group_body)
    lookup_class = self.new(:otf_lookup_row => row,
                            :otf_lookup => row.lookup)
    if group_body[:replaceable_glyphs]
      lookup_class.replace_flag = FLAGS[:sub]
      group_elements = group_body[:replaceable_glyphs][0]
    else
      lookup_class.replace_flag = FLAGS[:reserve]
      group_elements = group_body[:glyphs][0]
    end
    
    klass = row.lookup.font.classes.build(:name => nil) # Anonymous OtfClass
    group_elements.each do |name|
      if /^@/.match(name)
        klass = OtfClass.find_by_name(name)
        lookup_class.otf_class = klass
        break # Hope there is only one OtfClass
      else
        glyph = row.lookup.font.glyphs.find_or_create_by_name(name)
        klass.otf_glyphs << glyph
      end
    end
    lookup_class.otf_class = klass
    lookup_class
  end


end
