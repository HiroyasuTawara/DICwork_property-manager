class CreateNearStations < ActiveRecord::Migration[6.0]
  def change
    create_table :near_stations do |t|
      t.string :name
      t.string :route
      t.integer :required_time
      t.references :property, foreign_key: true
    end
  end
end
