class Season < ApplicationRecord
  belongs_to :program
  has_many :projects

  acts_as_paranoid
  audited
end
