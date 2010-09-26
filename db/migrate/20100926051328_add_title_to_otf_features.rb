class AddTitleToOtfFeatures < ActiveRecord::Migration
  def self.up
    add_column :otf_features, :title, :string
  end

  def self.down
    remove_column :otf_features, :title
  end
end
