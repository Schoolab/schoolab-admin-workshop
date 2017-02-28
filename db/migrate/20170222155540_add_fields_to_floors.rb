class AddFieldsToFloors < ActiveRecord::Migration[5.0]
  def change
    change_table :floors do |t|
      t.text :description
      t.string :colour
    end
  end
end
