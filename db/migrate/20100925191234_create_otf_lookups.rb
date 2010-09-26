class CreateOtfLookups < ActiveRecord::Migration
  def self.up
    create_table :otf_lookups do |t|
      t.integer :font_id, :null => false
      t.integer :feature_id, :null => false
      t.integer :language_id, :default => 0, :null => false
      t.string :name
      t.string :flag

      t.timestamps
    end
    add_index :otf_lookups, :name, :unique => true
  end

  def self.down
    drop_table :otf_lookups
  end
end
