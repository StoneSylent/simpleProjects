class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, uniqueness: true
      t.string :password_digest
      t.integer :location, precision: 5

      t.timestamps
    end
  end
end
