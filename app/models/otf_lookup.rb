class OtfLookup < ActiveRecord::Base
  belongs_to :feature, :class_name => OtfFeature.name
  belongs_to :font, :class_name => OpenTypeFont.name
  belongs_to :language
  has_many :otf_lookup_rows, :dependent => :destroy, :foreign_key => 'lookup_id', :include => :lookup_classes
  has_many :otf_classes, :through => :otf_lookup_rows
  
  def before_save
    self.font_id = self.feature.open_type_font_id
  end
end
