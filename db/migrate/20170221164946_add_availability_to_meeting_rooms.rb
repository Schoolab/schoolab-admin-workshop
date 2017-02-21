class AddAvailabilityToMeetingRooms < ActiveRecord::Migration[5.0]
  def change
    change_table :meeting_rooms do |t|
      t.string :status
    end
  end
end
