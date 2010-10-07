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

ActiveRecord::Schema.define(:version => 20101006215828) do

  create_table "categories", :force => true do |t|
    t.string "name"
  end

  add_index "categories", ["name"], :name => "index_categories_on_name"

  create_table "classes_glyphs", :force => true do |t|
    t.integer "otf_class_id"
    t.integer "otf_glyph_id"
    t.integer "position",     :default => 0
  end

  add_index "classes_glyphs", ["otf_class_id"], :name => "index_classes_glyphs_on_otf_class_id"
  add_index "classes_glyphs", ["otf_glyph_id"], :name => "index_classes_glyphs_on_otf_glyph_id"

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "examples", :force => true do |t|
    t.string  "cyrillic"
    t.string  "mongolian"
    t.text    "glyphs"
    t.integer "category_id", :default => 1
  end

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
    t.datetime "compiled_at"
  end

  create_table "otf_classes", :force => true do |t|
    t.string  "name"
    t.integer "open_type_font_id"
    t.string  "title"
    t.text    "description"
  end

  add_index "otf_classes", ["name"], :name => "index_otf_classes_on_name", :unique => true

  create_table "otf_features", :force => true do |t|
    t.integer  "open_type_font_id"
    t.integer  "parent_id"
    t.string   "name"
    t.string   "script"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "otf_files", :force => true do |t|
    t.integer  "font_id",                        :null => false
    t.string   "version",                        :null => false
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "compile_message"
    t.integer  "correct_count",   :default => 0
    t.integer  "incorrect_count", :default => 0
  end

  add_index "otf_files", ["version"], :name => "index_otf_files_on_version", :unique => true

  create_table "otf_glyphs", :force => true do |t|
    t.integer  "open_type_font_id"
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "description"
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
    t.integer  "user_id"
  end

  create_table "otf_lookups", :force => true do |t|
    t.integer  "font_id",                        :null => false
    t.integer  "feature_id",                     :null => false
    t.string   "name"
    t.string   "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
    t.boolean  "mch",         :default => false
    t.boolean  "mng",         :default => false
    t.boolean  "sib",         :default => false
    t.boolean  "tod",         :default => false
  end

  add_index "otf_lookups", ["name"], :name => "index_otf_lookups_on_name", :unique => true

  create_table "otf_unicodes", :force => true do |t|
    t.integer "open_type_font_id"
    t.string  "hex"
    t.integer "dec"
    t.string  "name"
    t.string  "description"
  end

  create_table "rendered_examples", :force => true do |t|
    t.integer  "example_id"
    t.integer  "file_id"
    t.boolean  "correct",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                       :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "editor",                              :default => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
