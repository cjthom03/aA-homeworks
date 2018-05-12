class SessionsController < ApplicationController

  before_action :ensure_log_out, only: [:new, :create]

  #login page
  def new
    @user = User.new
    render :new
  end

  #login existing user
  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user
      login!(user)
      redirect_to bands_url
    else
      flash[:errors] = ['Incorrect Username or Password.']
      render :new
    end
  end

  #logout user
  def destroy
    logout
    redirect_to new_session_url
  end
end
