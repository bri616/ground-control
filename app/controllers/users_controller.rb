class UsersController < ApplicationController
  skip_before_filter :logged_in, :current_teleporter, only: :authenticate

  def authenticate
    params.permit(:rank, :password)
      if login_attempt = User.find_by(rank: params[:rank])
        if login_attempt.authenticate(params[:password])
          session[:user_id] = login_attempt.id
        else
          raise "Wrong password"
        end
      else
        raise "Sorry, something went wrong"
      end
    redirect_to root_path
  end
end
