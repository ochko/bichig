# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100926012815) do

  create_table "languages", :force => true do |t|
    t.string "code"
    t.string "name"
  end

  create_table "open_type_fonts", :force => true do |t|
    t.string   "name"
    t.string   "source_file_name"
    t.string   "source_content_type"
    t.integer  "source_file_size"
    t.datetime "source_updated_at"
  end

  create_table "otf_classes", :force => true do |t|
    t.string  "name"
    t.integer "open_type_font_id"
  end

  add_index "otf_classes", ["name"], :name => "index_otf_classes_on_name", :unique => true

  create_table "otf_classes_otf_glyphs", :id => false, :force => true do |t|
    t.integer "otf_class_id"
    t.integer "otf_glyph_id"
  end

  add_index "otf_classes_otf_glyphs", ["otf_class_id"], :name => "index_otf_classes_otf_glyphs_on_otf_class_id"
  add_index "otf_classes_otf_glyphs", ["otf_glyph_id"], :name => "index_otf_classes_otf_glyphs_on_otf_glyph_id"

  create_table "otf_features", :force => true do |t|
    t.integer  "open_type_font_id"
    t.integer  "parent_id"
    t.string   "name"
    t.string   "script"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "otf_glyphs", :force => true do |t|
    t.integer  "open_type_font_id"
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "otf_glyphs", ["name"], :name => "index_otf_glyphs_on_name", :unique => true

  create_table "otf_lookup_classes", :force => true do |t|
    t.integer  "otf_lookup_id",                    :null => false
    t.integer  "otf_lookup_row_id",                :null => false
    t.integer  "otf_class_id",                     :null => false
    t.integer  "position",          :default => 0
    t.integer  "replace_flag",      :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "otf_lookup_rows", :force => true do |t|
    t.integer  "lookup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "otf_lookups", :force => true do |t|
    t.integer  "font_id",                    :null => false
    t.integer  "feature_id",                 :null => false
    t.integer  "language_id", :default => 0, :null => false
    t.string   "name"
    t.string   "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "otf_lookups", ["name"], :name => "index_otf_lookups_on_name", :unique => true

  create_table "otf_unicodes", :force => true do |t|
    t.integer "open_type_font_id"
    t.string  "hex"
    t.integer "dec"
    t.string  "name"
  end

end
