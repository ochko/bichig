class CreateOtfFiles < ActiveRecord::Migration
  def self.up
    create_table :otf_files do |t|
      t.integer :font_id, :null => false
      t.string :version, :null => false
      t.string :title

      t.timestamps
    end
    add_index :otf_files, :version, :unique => true
  end

  def self.down
    drop_table :otf_files
  end
end
