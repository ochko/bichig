class CreateOpenTypeFonts < ActiveRecord::Migration
  def self.up
    create_table :open_type_fonts do |t|
      t.string   :name
      t.string   :source_file_name    
      t.string   :source_content_type 
      t.integer  :source_file_size    
      t.datetime :source_updated_at   
    end
  end

  def self.down
    drop_table :open_type_fonts
  end
end
