class Event < ApplicationRecord
  has_attached_file :image, styles: { large: "1200x1200", medium: "300x300>", cover: "500x500>", thumb: "192x192>" }, default_url: ""
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  acts_as_paranoid
  audited

  def full_price
    if self.price == 0
      return 'Gratuit'
    else
      return self.price.to_s + '€'
    end
  end

  def friendly_date
    I18n.l(self.date, format: '%A %e %B')
  end

  def friendly_hour(time)
    return time.strftime('%kh') + (time.strftime('%M') != '00' ? time.strftime('%M') : '')
  end

  def picker_date
    if self.date.present?
      I18n.l(self.date, format: '%d/%m/%Y')
    else
      I18n.l(Date.today, format: '%d/%m/%Y')
    end
  end

end
