class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :product_image_id
      t.text :description
      t.decimal :price

      t.timestamps null: false
    end
  end
end
