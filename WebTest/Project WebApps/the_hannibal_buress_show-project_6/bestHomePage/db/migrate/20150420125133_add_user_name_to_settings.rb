class AddUserNameToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :user_name, :string
  end
end
