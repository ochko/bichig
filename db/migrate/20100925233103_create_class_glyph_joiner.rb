class CreateClassGlyphJoiner < ActiveRecord::Migration
  def self.up
    create_table :classes_glyphs do |t|
      t.integer :otf_class_id
      t.integer :otf_glyph_id
      t.integer :position, :default => 0
    end
    add_index :classes_glyphs, :otf_class_id
    add_index :classes_glyphs, :otf_glyph_id
  end

  def self.down
    drop_table :classes_glyphs
  end
end
