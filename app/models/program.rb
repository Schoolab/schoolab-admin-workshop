class Program < ApplicationRecord
  has_many :seasons, dependent: :destroy
  has_many :roles, as: :entity, dependent: :destroy
  has_many :users, through: :roles
  belongs_to :floor

  has_attached_file :image, styles: { large: "1200x1200", medium: "300x300>", cover: "500x500>", thumb: "192x192>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

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
