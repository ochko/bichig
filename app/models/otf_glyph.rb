class OtfGlyph < ActiveRecord::Base
  has_attached_file :image
  belongs_to :open_type_font
  has_and_belongs_to_many :otf_classes
  
  def path
    "/images/glyphs/#{self.name}.png"
  end

  def base?
    return !name.match(/^[^.]+$/).nil?
  end
  
  def isol?
    return !name.match(/^[a-zA-Z0-9]+[.][a-zA-Z0-9]*isol[a-zA-Z0-9]*/).nil?
  end
  
  def fina?
    return !name.match(/^[a-zA-Z0-9]+[.][a-zA-Z0-9]*fina[a-zA-Z0-9]*/).nil?
  end
  
  def medi?
    return !name.match(/^[a-zA-Z0-9]+[.][a-zA-Z0-9]*medi[a-zA-Z0-9]*/).nil?
  end
  
  def init?
    return !name.match(/^[a-zA-Z0-9]+[.][a-zA-Z0-9]*init[a-zA-Z0-9]*/).nil?
  end
  
  def var?
    return !name.match(/^[a-zA-Z0-9]+[.][a-zA-Z0-9]*var[a-zA-Z0-9]*/).nil?
  end
  
  def mvs?
    return !name.match(/^[a-zA-Z0-9]+[.][a-zA-Z0-9]*mvs[a-zA-Z0-9]*/).nil?
  end
  
  def fem?
    return !name.match(/^[a-zA-Z0-9]+[.][a-zA-Z0-9]*fem[a-zA-Z0-9]*/).nil?
  end
  
  def ligature?
    return !name.match(/^[a-zA-Z]+(18[A-F0-9][A-F0-9]){2,}/).nil?
  end
end
