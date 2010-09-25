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

ActiveRecord::Schema.define(:version => 20100925192750) do

  create_table "open_type_fonts", :force => true do |t|
    t.string   "name"
    t.string   "source_file_name"
    t.string   "source_content_type"
    t.integer  "source_file_size"
    t.datetime "source_updated_at"
  end

  create_table "otf_classes", :force => true do |t|
    t.string  "name"
    t.integer "open_type_font_id", :null => false
  end

  create_table "otf_features", :force => true do |t|
    t.integer  "open_type_font_id"
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

  create_table "otf_lookup_classes", :force => true do |t|
    t.integer  "otf_lookup_id"
    t.integer  "otf_class_id"
    t.integer  "position"
    t.integer  "replace_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "otf_lookups", :force => true do |t|
    t.integer  "feature_id"
    t.string   "name"
    t.string   "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "otf_unicodes", :force => true do |t|
    t.integer  "open_type_font"
    t.string   "hex"
    t.integer  "dec"
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end
