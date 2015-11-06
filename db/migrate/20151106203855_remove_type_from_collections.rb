class RemoveTypeFromCollections < ActiveRecord::Migration
  def change
    remove_column :collections, :type
  end
end
