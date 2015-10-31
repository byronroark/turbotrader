class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.string :item_image_id
      t.text :description
      t.decimal :price
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
