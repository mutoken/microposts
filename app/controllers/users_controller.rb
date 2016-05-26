class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_user, only: [:edit, :update]

  def show
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      flash[:success] = "Welcome to the sample app!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Updated!"
      redirect_to @user
    else
      render edit
    end
  end

  
  private
  
  def user_params
    #binding.pry
    params.require(:user).permit(:name,:email,:password,:password_confirmation, :location, :company, :profile)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def check_user
    # @user ←　編集しようとしているユーザー
    # current_user ←自分
    redirect_to root_url if @user != current_user
    binding.pry
  end
    

end
