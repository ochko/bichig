class AddDescriptionToOtfClasses < ActiveRecord::Migration
  def self.up
    add_column :otf_classes, :description, :text
  end

  def self.down
    remove_column :otf_classes, :description
  end
end
