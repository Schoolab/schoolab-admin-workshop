class Company < ApplicationRecord
  belongs_to :floor
  has_many :users

  has_attached_file :image, styles: { large: "1200x1200", medium: "300x300>", cover: "500x500>", thumb: "192x192>" }, default_url: "/images/:style/missing-company.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  acts_as_paranoid
  audited

  def employees
    return User.where('company_id = ?', self.id)
  end

end
