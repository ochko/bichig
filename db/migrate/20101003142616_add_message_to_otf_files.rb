class AddMessageToOtfFiles < ActiveRecord::Migration
  def self.up
    add_column :otf_files, :compile_message, :text
  end

  def self.down
    remove_column :otf_files, :compile_message
  end
end
