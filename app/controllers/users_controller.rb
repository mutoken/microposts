class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #binding.pry
  end

  def new
    @user = User.new
    #binding.pry
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the sample app!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
  @user = User.find(params[:id])
  if @user.update_attributes(user_params)
    flash[:success] = "Updated!"
  else
    render edit
  end
  redirect_to @user
  end

  
  private
  
  def user_params
    #binding.pry
    params.require(:user).permit(:name,:email,:password,:password_confirmation, :location, :company, :profile)
  end



end
