class AddDescriptionToOtfGlyphs < ActiveRecord::Migration
  def self.up
    add_column :otf_glyphs, :description, :string
  end

  def self.down
    remove_column :otf_glyphs, :description
  end
end
