class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :logged_in, :current_teleporter
  helper :all

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in
    if current_user == nil
      redirect_to landing_page_path
    end
  end

  def current_teleporter
    # TODO: fix associations between teleporters and users for case of multiples
    @current_teleporter ||= Teleporter.first
  end

end
