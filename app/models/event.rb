class Event < ApplicationRecord

  has_attached_file :image, styles: { large: "1200x1200", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def full_price
    if self.price == 0
      return 'Gratuit'
    else
      return self.price.to_s + ' €'
    end
  end

  def friendly_date
    I18n.l(self.date, format: '%A %e %B')
  end

  def picker_date
    if self.date.present?
      I18n.l(self.date, format: '%e %B %Y')
    else
      I18n.l(Date.today, format: '%e %B %Y')
    end
  end

end
