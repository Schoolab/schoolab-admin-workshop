class AddImageToCompanies < ActiveRecord::Migration[5.0]
  def up
    add_attachment :companies, :image
  end

  def down
    remove_attachment :companies, :image
  end
end
