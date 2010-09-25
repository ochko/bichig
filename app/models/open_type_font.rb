class OpenTypeFont < ActiveRecord::Base
  has_many :glyphs  , :class_name => OtfGlyph.name  
  has_many :unicodes, :class_name => OtfUnicode.name
  has_many :classes , :class_name => OtfClass.name
  has_many :features, :class_name => OtfFeature.name
end
