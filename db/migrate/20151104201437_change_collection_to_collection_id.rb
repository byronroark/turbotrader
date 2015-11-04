class ChangeCollectionToCollectionId < ActiveRecord::Migration
  def change
    rename_column :items, :collection, :collection_id
  end
end
