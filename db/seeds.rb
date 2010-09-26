font = OpenTypeFont.create(:name => 'Монгол бичиг')

Language.create(:code => 'MCH', :name => 'Manchu'    )
Language.create(:code => 'MNG', :name => 'Mongolian' )
Language.create(:code => 'SIB', :name => 'Sibe'      )
Language.create(:code => 'TOD', :name => 'Todo'      )

codes = []
codes << (0x1800..0x180E).to_a
codes << (0x1810..0x1819).to_a
codes << (0x1820..0x1877).to_a
codes << (0x1880..0x18AA).to_a

codes.flatten.each do |code|
  hex = code.to_s(16).upcase
  font.unicodes.create(:dec => code, :hex => hex, :name => "uni#{hex}")
end
