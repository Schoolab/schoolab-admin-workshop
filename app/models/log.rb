class Log < ApplicationRecord
  belongs_to :project

  acts_as_paranoid
  audited

  def friendly_date
    I18n.l(self.date, format: '%e %B %Y')
  end
end
