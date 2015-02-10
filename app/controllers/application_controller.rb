class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :logged_in
  helper :all

  private

  def current_user
    # @current_user ||= User.find_by(id: session[:user_id])
    @current_user = nil
  end

  def logged_in
    if current_user == nil
      redirect_to landing_page_path
    end
  end

  def current_teleporter
    @teleporter = Teleporter.find_by(uid:"826dev")
  end
end
