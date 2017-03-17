class Program < ApplicationRecord
  has_many :seasons, dependent: :destroy
  has_many :roles, as: :entity, dependent: :destroy
  has_many :users, through: :roles
  belongs_to :floor

  acts_as_paranoid
  audited

  def projects
    projects = []
    self.seasons.each do |season|
      projects.concat season.projects
    end
    projects
  end
end
