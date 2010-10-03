require 'otf_feature_file'
class OpenTypeFont < ActiveRecord::Base

  has_many :glyphs  , :class_name => OtfGlyph.name, :order => 'name'
  has_many :unicodes, :class_name => OtfUnicode.name, :order => 'name'
  has_many :classes , :class_name => OtfClass.name, :order => 'name'
  has_many :features, :class_name => OtfFeature.name
  has_many :lookups,  :through => :features
  has_many :files,    :class_name => OtfFile.name, :foreign_key => 'font_id'

  has_attached_file :source

  validates_length_of :name, :minimum => 2

  def last_lookup_update
    self.lookups.maximum(:updated_at)
  end

  def compiled?
    self.last_lookup_update && self.compiled_at &&
      (self.last_lookup_update < self.compiled_at)
  end

  def compiled!
    self.update_attribute(:compiled_at, Time.now)
  end

  def compile!
    file = OtfFile.generate_source_and_compile(self)
    self.compiled! if file
    file
  end

  def to_s
    "#{classes.named.join}\n\n#{features.join}\n\n"
  end

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
              feature.update_attribute(:script, body[:script])
            end
            if body[:inner_feature]
              child = self.features.find_or_create_by_name(body[:inner_feature])
              feature.childs << child
            end
            
            if body[:lookup_flag]
              if dummy_lookup.nil?
                dummy_lookup = feature.lookups.create(:name => feature.name)
              end
              dummy_lookup.update_attribute(:flag, body[:lookup_flag])
            end
            
            if body[:subtable]
              if dummy_lookup.nil?
                dummy_lookup = feature.lookups.create(:name => feature.name)
              end
              OtfLookupRow.build(dummy_lookup, body[:subtable])
            end
            
            if body[:lookup]
              lookup = feature.lookups.create(:name => body[:lookup],
                                              :language => language)
              
              body[:lookup_body][0].each do |element|
                lookup.update_attribute(:flag, element[:lookup_flag])
                if element[:subtable]
                  OtfLookupRow.build(lookup, element[:subtable])
                end
              end
            end
            
            if body[:language]
              language = body[:language]
              if !body[:exclude_default]
                feature.lookups.each do |lookup|
                  lookup.update_attribute(:language, language)
                end
              end
            end
            
            if body[:empty_lookup] && language
              lookup = feature.lookups.find_by_name(body[:empty_lookup])
              lookup.update_attribute(:language, language) if lookup
            end

          end
        end
      end

    end
  end
end
