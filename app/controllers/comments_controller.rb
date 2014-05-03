class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)

    if comment.save
      if comment_params[:com_user_type] == "Goal"
        goal_id = comment_params[:com_user_id]
        user_id = Goal.find(goal_id).user.id
        redirect_to user_goal_url(user_id, goal_id)
      else
        user_id = comment_params[:com_user_id]
        redirect_to user_url(user_id)
      end
    else
      flash[:errors] = comment.errors.full_messages
      redirect_to :back
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:body, :com_user_id, :com_user_type).merge(user_id: current_user.id)
  end

end
