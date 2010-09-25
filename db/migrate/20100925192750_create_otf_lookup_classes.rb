class CreateOtfLookupClasses < ActiveRecord::Migration
  def self.up
    create_table :otf_lookup_classes do |t|
      t.integer :otf_lookup_id
      t.integer :otf_class_id
      t.integer :position
      t.integer :replace_flag

      t.timestamps
    end
  end

  def self.down
    drop_table :otf_lookup_classes
  end
end
