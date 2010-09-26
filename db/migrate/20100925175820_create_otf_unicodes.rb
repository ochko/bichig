class CreateOtfUnicodes < ActiveRecord::Migration
  def self.up
    create_table :otf_unicodes do |t|
      t.integer  :open_type_font_id
      t.string   :hex
      t.integer  :dec
      t.string   :name
    end
  end

  def self.down
    drop_table :otf_unicodes
  end
end
