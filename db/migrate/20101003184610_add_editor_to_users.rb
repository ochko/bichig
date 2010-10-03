class AddEditorToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :editor, :boolean, :default => false
  end

  def self.down
    remove_column :users, :editor
  end
end
