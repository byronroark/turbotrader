class ChangeCategoryToCollection < ActiveRecord::Migration
  def change
    rename_column :items, :category, :collection
  end
end
