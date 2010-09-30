class AddLanguagesToOtfLookups < ActiveRecord::Migration
  def self.up
    add_column :otf_lookups, :mch, :boolean, :default => false
    add_column :otf_lookups, :mng, :boolean, :default => false
    add_column :otf_lookups, :sib, :boolean, :default => false
    add_column :otf_lookups, :tod, :boolean, :default => false
    remove_column :otf_lookups, :language_id
  end

  def self.down
    add_column :otf_lookups, :language_id, :integer
    remove_column :otf_lookups, :tod
    remove_column :otf_lookups, :sib
    remove_column :otf_lookups, :mng
    remove_column :otf_lookups, :mch
  end
end
