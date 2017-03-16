class Project < ApplicationRecord
  has_many :roles, as: :entity
  has_many :users, through: :roles

  belongs_to :season

  has_many :logs

  acts_as_paranoid
  audited

  # Project type can only be innovation project or startup
  validates :project_type, inclusion: { in: %w(innovation-project startup),
    message: "%{value} is not a valid type" }

  # Instance Methods
  def program
    self.season.program
  end

  # Class Methods
  def self.types_collection
    [
      ["Projet d'innovation", "innovation-project"],
      ["Startup", "startup"]
    ]
  end
end
