class CreateNoteCategories < ActiveRecord::Migration
  def change
    create_table :note_categories do |t|
      t.string :title

      t.timestamps
    end
  end
end
