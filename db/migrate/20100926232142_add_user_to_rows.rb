class AddUserToRows < ActiveRecord::Migration
  def self.up
    add_column :otf_lookup_rows, :user_id, :integer
  end

  def self.down
    remove_column :otf_lookup_rows, :user_id
  end
end
