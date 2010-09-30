class OtfLookup < ActiveRecord::Base
  belongs_to :feature, :class_name => OtfFeature.name
  belongs_to :font, :class_name => OpenTypeFont.name
  has_many :otf_lookup_rows, :dependent => :destroy, :foreign_key => 'lookup_id', :include => :lookup_classes
  has_many :otf_classes, :through => :otf_lookup_rows

  scope :default, :conditions => { :mch => false, :mng => false, 
    :sib => false, :tod => false}
  scope :by_language, lambda { |code| { :conditions => {code.downcase.to_sym => true } } }

  def before_save
    self.font_id = self.feature.open_type_font_id
  end

  def to_s
    output = "\tlookup #{name} {\n"
    output << "\t\tlookupflag #{flag};\n" if flag
    output << otf_lookup_rows.join
    output << "\t} #{name};\n"
  end
  
  # code should be MCH, MGL, SIB or TOD
  def language=(code)
    self[code.downcase.to_sym] = true if code
  end

  def language(code)
    self[code.downcase.to_sym]
  end
end
