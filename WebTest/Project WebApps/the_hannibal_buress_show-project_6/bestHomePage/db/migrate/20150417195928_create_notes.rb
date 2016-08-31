class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.datetime :date
      t.text :note

      t.timestamps null: false
    end
  end
end
