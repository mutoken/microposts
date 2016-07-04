class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
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
      render 'edit'
    end
  end

  def show_followings
    @title = "Followings"
    @user = User.find(params[:id])
    @follows = @user.following_users
    render 'show_follow'
  end

  def show_followers
    @title = "Followers"
    @user = User.find(params[:id])
    @follows = @user.follower_users
    render 'show_follow'
  end

  
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation, :location, :company, :profile)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def check_user
    # @user ←　編集しようとしているユーザー
    # current_user ←自分
    redirect_to root_url if @user != current_user
  end
    

end
