class MeetingRoom < ApplicationRecord
  belongs_to :floor

  has_many :reservations, dependent: :destroy

  def reservation_at(start_time, end_time)
    reservations = []
    self.reservations.each do |reservation|
      if start_time != reservation.end_time && end_time != reservation.start_time
        if start_time.between?(reservation.start_time, reservation.end_time)
          reservations.push reservation
        elsif end_time.between?(reservation.start_time, reservation.end_time)
          reservations.push reservation
        elsif reservation.start_time.between?(start_time, end_time)
          reservations.push reservation
        elsif reservation.end_time.between?(start_time, end_time)
          reservations.push reservation
        end
      end
    end
    if reservations.length > 0
      return reservations
    else
      return false
    end
  end


end
