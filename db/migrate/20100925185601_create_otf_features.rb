class CreateOtfFeatures < ActiveRecord::Migration
  def self.up
    create_table :otf_features do |t|
      t.integer  :open_type_font_id
      t.string :name
      t.string :script

      t.timestamps
    end
  end

  def self.down
    drop_table :otf_features
  end
end
