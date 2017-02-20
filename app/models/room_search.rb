class RoomSearch < ApplicationRecord

	date_time_attribute :start_time

	def friendly_start_time
		if self.start_time.present?
			I18n.l(self.start_time, format: '%d/%m/%Y')
		else
			I18n.l(Date.today, format: '%d/%m/%Y')
		end
	end

end
