class OtfClass < ActiveRecord::Base
  belongs_to :open_type_font
  has_and_belongs_to_many :otf_glyphs
  
  scope :named, :conditions => "name is not null"
  scope :anonymous, :conditions => "name is null"

  has_many :otf_lookup_classes
  has_many :otf_lookups, :through => :otf_lookup_classes
  
  def to_s
    "#{name}=[#{otf_glyphs.map{ |glyph| glyph.name}.join(' ')}];\n"
  end

  def glyphs_text=(glyphs)
    self.otf_glyphs = []
    glyphs.split.each do |glyph|
      self.otf_glyphs << OtfGlyph.find_by_name(glyph)
    end
    self.otf_glyphs.compact!
  end

  def glyphs_text
    self.otf_glyphs.map{ |glyph| glyph.name }.join("\n")
  end
end
