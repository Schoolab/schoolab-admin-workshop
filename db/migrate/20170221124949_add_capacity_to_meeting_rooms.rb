class AddCapacityToMeetingRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :meeting_rooms, :capacity, :integer, :default => 1
  end
end
