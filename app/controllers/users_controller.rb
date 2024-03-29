class UsersController < ApplicationController
  before_action :ensure_logged_in!, :only => [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    begin
      @user.try(:save)
      login(@user)
      redirect_to user_url(@user)#
    rescue
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def ensure_logged_in!
    redirect_to new_session_url unless current_user
  end

end
