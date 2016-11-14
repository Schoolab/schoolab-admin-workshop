class AddTimeToEvent < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :datetime
    change_table :events do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
    end
  end
end
