class AddUserForeignKeys < ActiveRecord::Migration
  def change
  	add_column :notes, :user_name, :string
  	add_column :settings, :user_name, :string
  end
end
