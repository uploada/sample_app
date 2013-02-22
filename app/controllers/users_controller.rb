class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end  


  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
<<<<<<< HEAD
      flash[:success] = "welcome to the Sample App!"
      redirect_to @user
=======
       sign_in @user
       flash[:success] = "welcome to the Sample App!"
       redirect_to @user
>>>>>>> sign-in-out
    else
      render 'new'
    end
  end

end
