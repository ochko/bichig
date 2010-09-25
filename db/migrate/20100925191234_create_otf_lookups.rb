class CreateOtfLookups < ActiveRecord::Migration
  def self.up
    create_table :otf_lookups do |t|
      t.integer :feature_id
      t.string :name
      t.string :flag

      t.timestamps
    end
  end

  def self.down
    drop_table :otf_lookups
  end
end
