class CreateOtfGlyphs < ActiveRecord::Migration
  def self.up
    create_table :otf_glyphs do |t|
      t.integer  :open_type_font_id
      t.string   :name
      t.string   :image_file_name    
      t.string   :image_content_type 
      t.integer  :image_file_size    
      t.datetime :image_updated_at   
    end
  end

  def self.down
    drop_table :otf_glyphs
  end
end
