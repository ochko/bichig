class OtfClass < ActiveRecord::Base
  belongs_to :open_type_font
  has_and_belongs_to_many :otf_glyphs
  
  scope :named, :conditions => "name is not null"
  scope :anonymous, :conditions => "name is null"
  
  def to_s
    "#{name}=[#{otf_glyphs.map{ |glyph| glyph.name}.join(' ')}];\n"
  end
end
