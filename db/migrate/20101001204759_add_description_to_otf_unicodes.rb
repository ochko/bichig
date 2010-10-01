class AddDescriptionToOtfUnicodes < ActiveRecord::Migration
  def self.up
    add_column :otf_unicodes, :description, :string
  end

  def self.down
    remove_column :otf_unicodes, :description
  end
end
