class MessagesController < ApplicationController
  def index
    if session[:user] != nil
      @messages = Message.joins(:user).select("messages.*","users.username").order(created_at: :desc)
      @comments = Comment.joins(:message, :user).select("comments.*","users.username")
      render "messages/index"
    else
      redirect_to "/"
    end
  end

  def post_message
    if session[:user] != nil
      message = Message.create(user: User.find(session[:user]["id"]), message: params[:message])
      if !message.valid?
        flash[:errors] = message.errors.messages
      end
      redirect_to "/messages"
    else
      redirect_to "/"
    end
  end
end
