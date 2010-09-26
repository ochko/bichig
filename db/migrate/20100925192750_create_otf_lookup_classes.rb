class CreateOtfLookupClasses < ActiveRecord::Migration
  def self.up
    create_table :otf_lookup_classes do |t|
      t.integer :otf_lookup_id, :null => false
      t.integer :otf_lookup_row_id, :null => false
      t.integer :otf_class_id, :null => false
      t.integer :position, :default => 0
      t.integer :replace_flag, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :otf_lookup_classes
  end
end
