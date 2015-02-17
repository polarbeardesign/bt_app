class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :gallery
      t.string :photo_title
      t.text :description
      t.string :filename
      t.integer :order
      t.string :path

      t.timestamps
    end
    add_index :photos, :gallery_id
  end
end
