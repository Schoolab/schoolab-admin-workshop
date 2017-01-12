class CreateMeetingRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :meeting_rooms do |t|
      t.string :name
      t.string :colour
      t.belongs_to :floor, index: true

      t.timestamps
    end

    add_attachment :meeting_rooms, :photo
  end
end
