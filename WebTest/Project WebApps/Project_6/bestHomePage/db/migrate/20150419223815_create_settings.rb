class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :background
      t.integer :fontSize
      t.string :fontColor
      t.string :fontFamily

      t.timestamps
    end
  end
end
