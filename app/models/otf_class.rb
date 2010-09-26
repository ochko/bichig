class OtfClass < ActiveRecord::Base
  belongs_to :open_type_font
  has_and_belongs_to_many :otf_glyphs
end
