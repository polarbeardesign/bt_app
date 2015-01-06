class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start
      t.datetime :end
      t.string :type
      t.string :title
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
