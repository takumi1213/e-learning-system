class UsersController < ApplicationController
  before_action :logged_in_user, except: [:index ,:new, :create, :show, :destroy]
  before_action :correct_user, only: :edit

  def index
    @users = User.paginate(page: params[:page], per_page: 10 )
  end

  def show
    @user = User.find(params[:id])
  end

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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated!!"
      redirect_to root_url
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def correct_user
    user = User.find(params[:id])
     if user != current_user
      flash[:danger] = "You're not authorized."
      redirect_to root_url
     end
  end
end
