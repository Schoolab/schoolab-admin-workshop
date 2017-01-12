class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.belongs_to :meeting_room, index: true
      t.belongs_to :user, index: true

      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
