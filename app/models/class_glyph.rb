class ClassGlyph < ActiveRecord::Base
  set_table_name :classes_glyphs
  belongs_to :otf_class
  belongs_to :otf_glyph
end
