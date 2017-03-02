class Floor < ApplicationRecord
  has_many :companies
  has_many :meeting_rooms, dependent: :destroy

  acts_as_paranoid
  audited

  def residents_nb(companies)
    residents = 0

    if companies.present?
      companies.each do |company|
        residents += company.employees.count
      end
    end

    return residents

  end

end
