class AddItemSoldAtToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :item_sold_at, :datetime
  end
end
