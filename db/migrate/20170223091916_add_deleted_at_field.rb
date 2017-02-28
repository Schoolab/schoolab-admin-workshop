class AddDeletedAtField < ActiveRecord::Migration[5.0]
  def change
    add_column :meeting_rooms, :deleted_at, :time
    add_column :floors, :deleted_at, :time
    add_column :companies, :deleted_at, :time
    add_column :events, :deleted_at, :time
    add_column :reservations, :deleted_at, :time
    add_column :users, :deleted_at, :time
  end
end
