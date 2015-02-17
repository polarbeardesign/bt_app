class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :gallery_name
      t.text :description
      t.string :gallery_pic

      t.timestamps
    end
  end
end
