class CreateExamples < ActiveRecord::Migration
  def self.up
    create_table :examples do |t|
      t.string :cyrillic
      t.string :mongolian
      t.text   :glyphs 
    end
  end

  def self.down
    drop_table :examples
  end
end
