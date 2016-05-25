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
      #binding.pry
      flash[:success] = "Welcome to the sample app!"
      redirect_to @user
    else
      render 'new'
    end
    #binding.pry
  end
  
  private
  
  def user_params
    #binding.pry
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end



end
