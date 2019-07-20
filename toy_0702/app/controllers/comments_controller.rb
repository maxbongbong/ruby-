class CommentsController < ApplicationController
  
  def create
    comment = Comment.create(comment_params)
    comment.update(user: current_user)
    redirect_to contact_path(comment.contact)
  end

  def destroy
    comment = Comment.where(id: params[:id]).first
    @contact = comment.contact
    comment.destroy
    redirect_to contact_path(@contact)
  end

private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :contact_id)
  end
end
