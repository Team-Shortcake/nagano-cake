class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.integer :price
      t.string :name
      t.string :image_id
      t.text :explanation

      t.timestamps
    end
  end
end
