class ChangeCollectionIdDatatypeForItems < ActiveRecord::Migration
  def change
    change_column :items, :collection_id, :integer
  end
end
