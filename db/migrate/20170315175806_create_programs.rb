class CreatePrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :programs do |t|
      t.string :name, null: false
      t.text :description, null: false

      t.timestamps
      t.time :deleted_at
    end

    add_attachment :programs, :image

    create_table :roles do |t|
      t.string :name, null: false
      t.integer :user_id, index: true
      t.integer :entity_id
      t.integer :entity_type

      t.timestamps
      t.time :deleted_at
    end

    add_index :roles, [:entity_id, :entity_type]

    create_table :seasons do |t|
      t.string :name, null: false
      t.integer :program_id, index: true

      t.date :start_date
      t.date :end_date

      t.timestamps
      t.time :deleted_at
    end

    create_table :projects do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.text :description

      t.integer :season_id, index: true

      t.timestamps
      t.time :deleted_at
    end

    create_table :logs do |t|
      t.string :title, null: false
      t.date :date
      t.text :description

      t.integer :project_id, index: true

      t.timestamps
      t.time :deleted_at
    end

    add_attachment :logs, :image
  end
end
