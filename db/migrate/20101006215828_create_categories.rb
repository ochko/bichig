class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
    end
    add_index :categories, :name

    Category.reset_column_information
    Category.create(:id => 1, :name => 'No Category')
    add_column :examples, :category_id, :integer, :default => 1
  end

  def self.down
    drop_table :categories
  end
end
