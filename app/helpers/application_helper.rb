module ApplicationHelper
  def stack_glyphs(glyphs)
    if glyphs
      glyphs.split.map do |glyph|
        image_tag("/images/glyphs/#{glyph}.png")
      end
    end
  end
end
