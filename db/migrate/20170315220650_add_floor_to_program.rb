class AddFloorToProgram < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :foor_id, :integer, index: true
  end
end
