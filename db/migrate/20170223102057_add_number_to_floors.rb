class AddNumberToFloors < ActiveRecord::Migration[5.0]
  def change
    change_table :floors do |t|
      t.integer :number
    end
  end
end
