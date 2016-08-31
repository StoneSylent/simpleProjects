class RemoveuserNameFromSettings < ActiveRecord::Migration
  def change
  	remove_column :settings, :user_name
  end
end
