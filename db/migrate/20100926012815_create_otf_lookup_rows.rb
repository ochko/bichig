class CreateOtfLookupRows < ActiveRecord::Migration
  def self.up
    create_table :otf_lookup_rows do |t|
      t.integer :lookup_id

      t.timestamps
    end
  end

  def self.down
    drop_table :otf_lookup_rows
  end
end
