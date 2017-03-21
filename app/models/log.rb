class Log < ApplicationRecord
  belongs_to :project

  has_attached_file :image, styles: { large: "1200x1200", medium: "300x300>", cover: "500x500>", thumb: "192x192>" }, default_url: ""
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  acts_as_paranoid
  audited

  def friendly_date
    I18n.l(self.date, format: '%e %B %Y')
  end

  def picker_date
    if self.date.present?
      I18n.l(self.date, format: '%d/%m/%Y')
    else
      I18n.l(Date.today, format: '%d/%m/%Y')
    end
  end
end
