class AddDescriptionToOtfLookups < ActiveRecord::Migration
  def self.up
    add_column :otf_lookups, :description, :text
  end

  def self.down
    remove_column :otf_lookups, :description
  end
end
