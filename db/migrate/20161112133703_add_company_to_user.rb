class AddCompanyToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.belongs_to :company, index: true
    end
  end
end
