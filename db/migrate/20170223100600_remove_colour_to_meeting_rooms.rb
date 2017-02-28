class RemoveColourToMeetingRooms < ActiveRecord::Migration[5.0]
  def change
    remove_column :meeting_rooms, :colour
  end
end
