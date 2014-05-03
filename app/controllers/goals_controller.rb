class GoalsController < ApplicationController
  def index
    @goals = Goal.where(privacy: "Public" )
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    if @goal.save
      redirect_to user_url(current_user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def completed
    @goal = Goal.find(params[:id])
    @goal.completion = true
    @goal.save!

    redirect_to user_url(@goal.user)
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :privacy)
  end
end
