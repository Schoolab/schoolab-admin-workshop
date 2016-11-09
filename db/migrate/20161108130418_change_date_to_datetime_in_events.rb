class ChangeDateToDatetimeInEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :datetime, :datetime
  end
end
