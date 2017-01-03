class RoomSearch
  include ActiveModel::Model

  attr_accessor :start_time, :length
  validates_presence_of :start_time
end