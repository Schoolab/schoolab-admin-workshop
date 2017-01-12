class MeetingRoom < ApplicationRecord
  belongs_to :floor

  has_many :reservations

  def reservation_at(start_time, end_time)
    self.reservations.each do |reservation|
      if start_time.between?(reservation.start_time, reservation.end_time)
        return reservation
      elsif end_time.between?(reservation.start_time, reservation.end_time)
        return reservation
      end
    end
    return false
  end
end
