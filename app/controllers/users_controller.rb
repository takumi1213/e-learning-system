class UsersController < ApplicationController
  before_action :logged_in_user, except: [:index ,:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully Created an Account!! "
      redirect_to root_url
    else
        render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    
  end
  
end
