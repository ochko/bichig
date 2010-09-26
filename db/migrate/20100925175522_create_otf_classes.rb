class CreateOtfClasses < ActiveRecord::Migration
  def self.up
    create_table :otf_classes do |t|
      t.string :name
      t.integer :open_type_font_id
    end
    
    add_index :otf_classes, :name, :unique => true
  end

  def self.down
    drop_table :otf_classes
  end
end
