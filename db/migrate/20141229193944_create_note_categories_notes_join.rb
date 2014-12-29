class CreateNoteCategoriesNotesJoin < ActiveRecord::Migration
  def up
  create_table :note_categories_notes, :id => false do |t|
    t.integer "note_category_id"
    t.integer "note_id"
  end
  add_index :note_categories_notes, ["note_category_id", "note_id"]
  end

  def down
  end
end
