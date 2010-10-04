class OtfFile < ActiveRecord::Base
  DIR = Rails.root.join('public','system','fonts')
  SCRIPT_DIR = Rails.root.join('script')
  FEATURE_APPLY = 'changefeature.py'
  BASE_FONT = "#{Rails.root.join('public','system','template')}/empty.ttf"
  COMPILE_CMD = "#{SCRIPT_DIR}/#{FEATURE_APPLY}"
  RENDER_CMD = "/usr/bin/pango-view --font='%s' --rotate=90 --gravity=north --dpi=150 -q -o %s.png %s"

  belongs_to :font, :class_name => OpenTypeFont.name
  has_many :rendered_examples, :foreign_key => 'file_id'
  has_many :examples, :through => :rendered_examples
  
  def passed?
    correct_count > 0 && incorrect_count == 0
  end

  def render_examples!
    imagesdir = "#{DIR}/#{self.version}"
    txtfile = "#{imagesdir}/txt.tmp"
    FileUtils.mkdir(imagesdir) unless File.directory?(imagesdir)
    Example.all.each do |example|
      File.open(txtfile, 'w') { |f| f.write(example.mongolian) }
      imagefile = "#{imagesdir}/#{example.id}"
      cmd = RENDER_CMD % [self.font_name, imagefile, txtfile]
      if system(cmd)
        self.rendered_examples.find_or_create_by_example_id(example.id)
      end
    end
    count_correctness!
  end

  def count_correctness!
    self.update_attributes(:correct_count => self.rendered_examples.correct.count, :incorrect_count => self.rendered_examples.incorrect.count)
  end
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
