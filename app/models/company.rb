class Company < ApplicationRecord
  belongs_to :floor
  has_many :users
end
