class CreateRenderedExamples < ActiveRecord::Migration
  def self.up
    create_table :rendered_examples do |t|
      t.integer :example_id
      t.integer :file_id
      t.boolean :correct, :default => false

      t.timestamps
    end
    add_column :otf_files, :correct_count, :integer, :default => 0
    add_column :otf_files, :incorrect_count, :integer, :default => 0
  end

  def self.down
    drop_table :rendered_examples
  end
end
