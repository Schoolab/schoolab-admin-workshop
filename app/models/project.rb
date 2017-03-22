class Project < ApplicationRecord
  has_many :roles, as: :entity, dependent: :destroy
  has_many :users, through: :roles

  has_attached_file :image, styles: { large: "1200x1200", medium: "300x300>", cover: "500x500>" , thumb: "192x192>" }, default_url: "/images/:style/missing-image.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

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

  def full_name
    self.name + ' (' + self.season.name + ' - ' + self.program.name + ')'
  end

  # Class Methods
  def self.types_collection
    [
      ["Projet d'innovation", "innovation-project"],
      ["Startup", "startup"]
    ]
  end

end
