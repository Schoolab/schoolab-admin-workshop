class ChangeUserDefaultRole < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :role, "inactive"
  end
end
