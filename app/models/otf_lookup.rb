class OtfLookup < ActiveRecord::Base
  belongs_to :feature, :class_name => OtfFeature.name
  has_many :otf_lookup_classes
  has_many :otf_classes, :through => :otf_lookup_classes
end
