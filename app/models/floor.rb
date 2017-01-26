class Floor < ApplicationRecord
  has_many :companies
  has_many :meeting_rooms, dependent: destroy
end
