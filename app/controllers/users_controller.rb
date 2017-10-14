class UsersController < ApplicationController

  def new
  end
  
  def create
    p user_params[:email]
    if User.find_by_email(user_params[:email]) 
      redirect_to '/login'
    else
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/signup'
      end
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :email, :password_digest, :password_confirmation)
  # end

  # what to do with password confirmation?

end
