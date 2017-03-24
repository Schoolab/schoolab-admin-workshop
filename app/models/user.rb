class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable,
          :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_default_role

  has_attached_file :photo, styles: { medium: "300x300>", cover: "500x500>", thumb: "192x192>" }, default_url: "/images/:style/missing-resident.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  has_many :reservations, dependent: :destroy

  validates :current_password, presence: true, allow_blank: true, on: :update

  belongs_to :company

  has_many :roles, dependent: :destroy

  has_many :projects, through: :roles, source: :entity, source_type: 'Project'

  ROLES = %i[admin user inactive]

  acts_as_paranoid
  audited

  # Instance methods

  def name
    self.first_name + " " + self.last_name
  end

  def is_admin?
    self.role == 'admin'
  end

  def company_name
    if self.company.present?
      self.company.name
    else
      "N/A"
    end
  end

  def choose_name
    self.name + " / " + self.company_name
  end

  private
    def set_default_role
      self.role = "user"
    end
end
