class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :price
      t.references :item, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
