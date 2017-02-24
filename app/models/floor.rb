class Floor < ApplicationRecord
  has_many :companies
  has_many :meeting_rooms, dependent: :destroy

  acts_as_paranoid

  def residents_nb(companies)
    residents = 0

    if companies.present?
      companies.each do |company|
        employees = User.where('company_id = ?', company.id)
        residents += employees.count
      end
    end

    return residents

  end

end
