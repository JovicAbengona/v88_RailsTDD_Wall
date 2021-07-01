class UsersController < ApplicationController
  # Load index plage
  def index
  end
  # Load registration page
  def register
  end
  # Load registration page
  def login
  end
  # Process login
  def user_login
    user = User.select("*").where("username = ?", user_params[:username])
    if user.length == 1
      session[:user] = user[0]
      redirect_to "/messages"
    else
      new_user = User.create(username: "#{user_params[:username]}", email: "#{user_params[:username]}@gmail.com", password: "qweasdzxc", first_name: "John", last_name: "Doe")
      if new_user.valid?
        session[:user] = new_user
        redirect_to "/messages"
      else
        flash[:errors] = new_user.errors.messages
        redirect_to "/login"
      end    
    end
  end
  # Process logout
  def logout
    reset_session
    redirect_to "/login"
  end
  # process user_params
  private
    def user_params
      params.require(:user).permit(:username)
    end
end
