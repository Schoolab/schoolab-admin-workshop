class Project < ApplicationRecord
  has_many :roles, as: :entity
  has_many :users, through: :roles

  belongs_to :season

  has_many :logs

  acts_as_paranoid
  audited

  def program
    self.season.program
  end
end
