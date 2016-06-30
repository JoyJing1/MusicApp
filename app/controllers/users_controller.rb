class UsersController < ApplicationController
  helper_method :current_user
  helper_method :logged_in?
  helper_method :log_in_user!

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    user.session_token = user.ensure_session_token
    session[:session_token] = user.session_token

    if user.save!
      redirect_to user_url(user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def user_params
    params.require(:user).permit(:email, :password, :session_token)
  end
end
