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
       sign_in @user
       flash[:success] = "welcome to the Sample App!"
       redirect_to @user
       #redirect_to action: 'show', id: @user.id
    else
      render 'new'
    end
  end

end
