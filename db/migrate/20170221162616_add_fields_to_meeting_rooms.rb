class AddFieldsToMeetingRooms < ActiveRecord::Migration[5.0]
  def change
    change_table :meeting_rooms do |t|
      t.text :description
      t.boolean :reservable, default: false
    end
  end
end
