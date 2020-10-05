class CommentsController < ApplicationController

  def create
    @message = Message.find(params[:message_id])
    #finding message and create comment according to the message id
    @comment = @message.comment.create(comment_params)
  #  findig comment a/c to current user
    @comment.user_id = current.user_id

    if comment.save
      redirect_to message_path(@message)
    else
      render 'new'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end