class AddDescriptionToCompany < ActiveRecord::Migration[5.0]
  def up
    add_column :companies, :description, :text, limit: 300
  end

  def down
    add_column :companies, :description, :text
  end
end
