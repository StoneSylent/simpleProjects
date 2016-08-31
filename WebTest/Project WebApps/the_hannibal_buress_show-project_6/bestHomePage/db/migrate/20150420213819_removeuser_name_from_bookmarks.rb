class RemoveuserNameFromBookmarks < ActiveRecord::Migration
  def change
    remove_column :bookmarks, :user_name
  end
end
