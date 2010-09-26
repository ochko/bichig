class CreateClassGlyphJoiner < ActiveRecord::Migration
  def self.up
    create_table :otf_classes_otf_glyphs, :id => false do |t|
      t.integer :otf_class_id
      t.integer :otf_glyph_id
    end
    add_index :otf_classes_otf_glyphs, :otf_class_id
    add_index :otf_classes_otf_glyphs, :otf_glyph_id
  end

  def self.down
    drop_table :otf_classes_otf_glyphs
  end
end
