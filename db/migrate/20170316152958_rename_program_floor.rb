class RenameProgramFloor < ActiveRecord::Migration[5.0]
  def change
    rename_column :programs, :foor_id, :floor_id
  end
end
