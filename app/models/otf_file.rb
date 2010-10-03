class OtfFile < ActiveRecord::Base
  DIR = Rails.root.join('public','system','fonts')
  SCRIPT_DIR = Rails.root.join('script')
  FEATURE_APPLY = 'changefeature.py'
  BASE_FONT = "#{Rails.root.join('backup')}/template.ttf"
  # Compile command should take 3 arguments below:
  # compile_cmd base_font feature_file_name output_file_name
  COMPILE_CMD = "#{SCRIPT_DIR}/#{FEATURE_APPLY}"
  
  belongs_to :font, :class_name => OpenTypeFont.name

  def source_name
    "#{self.version}.fea"
  end
  def binary_name
    "#{self.version}.ttf"
  end
  def font_name
    "MongolBichig#{self.version}"
  end
  def source
    "#{DIR}/#{self.source_name}"
  end
  def binary
    "#{DIR}/#{self.binary_name}"
  end
  def has_source?
    File.exist?(self.source)
  end
  def has_binary?
    File.exist?(self.binary)
  end
  def has_any_file?
    has_source? || has_binary?
  end

  def self.generate_source_and_compile(font)
    FileUtils.mkdir(DIR) unless File.directory?(DIR)
    file = font.files.build(:version => Time.now.strftime("%Y%m%d%H%M%S"))
    file.generate_source
    file.compile_source
    if file.has_any_file?
      file.save && file 
    else
      nil
    end
  end

  def generate_source
    File.open(self.source, 'w') do |source_file|
      source_file.write(self.font.to_s)
    end
  end

  def compile_source
    if File.exist?(self.source)
      self.compile_message = `#{COMPILE_CMD} #{BASE_FONT} #{self.source} #{self.binary} #{self.font_name} 2>&1`
      self.save
      if File.exist?(self.binary) 
        `fc-cache #{DIR}`
      end
    end
  end

end
