class AddCommentToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :note, :text, limit: 300
  end
end
