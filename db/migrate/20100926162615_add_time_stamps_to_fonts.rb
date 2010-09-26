class AddTimeStampsToFonts < ActiveRecord::Migration
  def self.up
    add_column :open_type_fonts, :compiled_at, :datetime
  end

  def self.down
    remove_column :open_type_fonts, :compiled_at
  end
end
