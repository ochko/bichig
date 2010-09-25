class CreateOtfClasses < ActiveRecord::Migration
  def self.up
    create_table :otf_classes do |t|
      t.string :name
      t.integer :open_type_font_id, :null => false
    end
  end

  def self.down
    drop_table :otf_classes
  end
end
