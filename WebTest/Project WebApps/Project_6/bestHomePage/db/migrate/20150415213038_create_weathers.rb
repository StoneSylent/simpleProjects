class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.integer :location
      t.integer :high
      t.integer :low
      t.string :condition
      t.integer :wind_speed
      t.string :loc_name
      t.integer :sunrise
      t.integer :sunset

      t.timestamps
    end
  end
end
