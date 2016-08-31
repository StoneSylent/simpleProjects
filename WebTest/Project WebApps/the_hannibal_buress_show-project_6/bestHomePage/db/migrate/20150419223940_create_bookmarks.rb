class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :user_name
      t.string :url

      t.timestamps
    end
  end
end
