class HomeController < ApplicationController
  skip_authorization_check

  def index
    if Event.where("date = ?", Time.zone.today).present? && (Event.where("date = ?", Time.zone.today).count > 3)
      @events = Event.where("date = ?", Time.zone.today).order(date: :asc)
    else
      @events = Event.where("date >= ?", Time.zone.today).order(date: :asc).take(3)
    end

    unless user_signed_in?
      redirect_to new_user_session_path
    else
      @reservations = current_user.reservations.where('reservations.end_time > ?', Time.current).order('reservations.start_time ASC')
      @newbies = User.where('created_at >= ?', Time.zone.today - 7).order('created_at DESC')
    end
  end

  def letsencrypt
    render text: "6g1JAe917vtb5Vfqdl1gi6DaYVh0ytQM7JGtLg5H-4c.7ZOkhneCPOvhRZC3YBTjsKQ2ay-VDIHQfmAjNDLvpb0"
  end
end
