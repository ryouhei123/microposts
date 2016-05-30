class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update]
  before_action :logincheck, only:[:edit, :update]

  def show 
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user 
    else
      render 'new'
    end
  end
  
  def edit
 
  end
  
  def update

    if (@user.update(user_profile))
      flash[:success] = "更新しました。"
    end
    redirect_to user_path(@user) 
  end
    

  private
  
  def logincheck
    @user = User.find(params[:id])
    if (current_user != @user)
      redirect_to :root
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
  def user_profile
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,
                                 :profile, :place)
  end
end
