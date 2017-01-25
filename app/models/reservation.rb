class Reservation < ApplicationRecord
  belongs_to :meeting_room
  belongs_to :user

  before_create :set_default_end_time
  def set_default_end_time
    if self.end_time == nil
      self.end_time = (self.start_time + 1.hours).to_datetime
    end
  end

  def date
    self.start_time.strftime('%d/%m/%y')
  end

  def friendly_date
    I18n.l(self.start_time, format: '%A %e %B')
  end

  def time
    time = self.start_time.strftime('%Hh%M')
    time += self.end_time.strftime(' - %Hh%M')
  end
end
