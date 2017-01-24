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

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  has_many :reservations

  validates :current_password, presence: true, allow_blank: true, on: :update

  belongs_to :company

  ROLES = %i[admin user inactive]

  def name
    self.first_name + " " + self.last_name
  end

  def company_name
    if self.company.present?
      self.company.name
    else
      "N/A"
    end

  private
  def set_default_role
    self.role = "user"
  end
end
