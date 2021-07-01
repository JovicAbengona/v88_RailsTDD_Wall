class CommentsController < ApplicationController
  def post_comment
    if session[:user] != nil
      comment = Comment.create(message: Message.find(params[:id]), user: User.find(session[:user]["id"]), comment: params[:comment])
      if !comment.valid?
        flash[:errors] = comment.errors.messages
      end
      redirect_to "/messages"
    else
      redirect_to "/"
    end
  end
end
