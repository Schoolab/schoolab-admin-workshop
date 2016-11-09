class CreateFloors < ActiveRecord::Migration[5.0]
  def change
    create_table :floors do |t|
      t.string :name

      t.timestamps
    end
    change_table :companies do |t|
      t.belongs_to :floor, index: true
    end
  end
end
