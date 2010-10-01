class OtfUnicode < ActiveRecord::Base
  belongs_to :open_type_font
  
  def path
    "/images/glyphs/#{self.name}.png"
  end
end
