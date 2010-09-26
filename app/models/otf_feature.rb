class OtfFeature < ActiveRecord::Base
  belongs_to :open_type_font
  belongs_to :parent, :class_name => self.name
  has_many :childs, :foreign_key => 'parent_id', :class_name => self.name
  has_many :lookups, :foreign_key => 'feature_id', :class_name => OtfLookup.name, :dependent => :destroy
  
  def before_save
    self.open_type_font = parent.open_type_font if parent
  end
end
