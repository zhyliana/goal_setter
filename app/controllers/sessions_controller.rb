class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(user_params[:username])
    # fail
    if @user && @user.password == user_params[:password]
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Incorrect Username/Password"]
      @user = User.new if !@user
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
