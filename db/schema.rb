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

ActiveRecord::Schema.define(:version => 20141229193944) do

  create_table "note_categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "note_categories_notes", :id => false, :force => true do |t|
    t.integer "note_category_id"
    t.integer "note_id"
  end

  add_index "note_categories_notes", ["note_category_id", "note_id"], :name => "index_note_categories_notes_on_note_category_id_and_note_id"

  create_table "notes", :force => true do |t|
    t.string   "title"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
