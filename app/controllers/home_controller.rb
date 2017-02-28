class HomeController < ApplicationController
  skip_authorization_check

  def index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def letsencrypt
    render text: "6g1JAe917vtb5Vfqdl1gi6DaYVh0ytQM7JGtLg5H-4c.7ZOkhneCPOvhRZC3YBTjsKQ2ay-VDIHQfmAjNDLvpb0"
  end
end
