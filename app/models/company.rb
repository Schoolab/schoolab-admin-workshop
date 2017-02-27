class Company < ApplicationRecord
  belongs_to :floor
  has_many :users

  has_attached_file :image, styles: { large: "1200x1200", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  acts_as_paranoid
end
