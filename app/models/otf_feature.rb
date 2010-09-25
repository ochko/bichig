class OtfFeature < ActiveRecord::Base
  belongs_to :open_type_font
  has_many :lookups, :class_name => OtfLookup.name
end
