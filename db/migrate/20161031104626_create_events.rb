class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|

      t.string :title, null: false, default: ""
      t.date :datetime, null: false
      t.string :location, null: false, default: ""
      t.string :host
      t.float :price, null: false, default: 0
      t.string :link
      t.text :description, limit: 140
      t.boolean :internal, default: true
      t.boolean :weekly, default: false

      t.timestamps
    end
  end
end
