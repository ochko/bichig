require 'otf_feature_file'
class OpenTypeFont < ActiveRecord::Base

  has_many :glyphs  , :class_name => OtfGlyph.name  
  has_many :unicodes, :class_name => OtfUnicode.name
  has_many :classes , :class_name => OtfClass.name
  has_many :features, :class_name => OtfFeature.name

  has_attached_file :source

  validates_length_of :name, :minimum => 2

  def populate_from_source
    file_content = '';
    File.open(self.source.path, "r") do |f|
      f.each_line do |line|
        file_content += line
      end
    end
    syntaxParser = OTFFeatureFileSyntaxParser.new
    content = syntaxParser.parse(file_content)
    if (content)
      content = content.content
      
      content.each do |file_content|
        name = file_content[:name]
        
        if /^@/.match(name) # otf class definition
          klass = self.classes.create(:name => name)
          file_content[:glyphs].each do |glyphname|
            glyph = self.glyphs.find_or_create_by_name(glyphname)
            klass.otf_glyphs << glyph
          end
        else # otf feature definition
          feature = self.features.find_or_create_by_name(name)
          
          # some features have no lookup but subtables
          dummy_lookup = nil;
          language = nil;
          
          file_content[:feature_body][0].each do |body|
            if body[:script]
              feature.script = body[:script]
            end
            if body[:inner_feature]
              child = self.features.find_or_create_by_name(body[:inner_feature])
              feature.childs << child
            end
            
            if body[:lookup_flag]
              if dummy_lookup.nil?
                dummy_lookup = feature.lookups.new(feature.name)
              end
              dummy_lookup.flag = body[:lookup_flag]
            end
            
            if body[:subtable]
              if dummy_lookup.nil?
                dummy_lookup = feature.lookups.new(feature.name)
              end
              OtfLookupRow.build(dummy_lookup, body[:subtable])
            end
            
            if body[:lookup]
              lookup = feature.lookups.new(:name => body[:lookup])
              lookup.languge = language if language
              
              body[:lookup_body][0].each do |element|
                lookup.flag = element[:lookup_flag] if element[:lookup_flag]
                if element[:subtable]
                  OtfLookupRow.build(lookup, element[:subtable])
                end
              end
            end
            
            if body[:language]
              language = Language.find_by_name(body[:language])
            end
            
          end
        end
      end

    end
  end
end
