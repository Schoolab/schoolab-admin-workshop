class CreateRoomSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :room_searches do |t|
      t.datetime :start_time, null: false
      t.time :length_time, null: false
      t.integer :length, null: false

      t.timestamps
    end
  end
end
