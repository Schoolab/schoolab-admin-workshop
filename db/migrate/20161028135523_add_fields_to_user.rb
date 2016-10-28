class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :phone
      t.string :title
    end
  end
end
