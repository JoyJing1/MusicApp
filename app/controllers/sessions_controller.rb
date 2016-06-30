class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
      log_in_user!(@user)
      redirect_to user_url(@user.id)
    else
      flash[:errors] = ["Invalid User Credentials"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to bands_url
    # user.reset_session_token!
  end

end
