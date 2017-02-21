class AddPhoneEmailToCompanies < ActiveRecord::Migration[5.0]
  def change
    change_table :companies do |t|
      t.string :phone
      t.string :email
    end
  end
end
