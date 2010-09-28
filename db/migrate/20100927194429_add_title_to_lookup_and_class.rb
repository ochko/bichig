class AddTitleToLookupAndClass < ActiveRecord::Migration
  def self.up
    add_column :otf_classes, :title, :string
    add_column :otf_lookups, :title, :string
  end

  def self.down
    remove_column :otf_classes, :title
    remove_column :otf_lookups, :title
  end
end
