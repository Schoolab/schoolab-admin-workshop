class Program < ApplicationRecord
  has_many :seasons
  has_many :roles, as: :entity
  has_many :users, through: :roles

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
