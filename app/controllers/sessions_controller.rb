class SessionsController < ApplicationController
  def new
  end

  def create
    # params[:session][:email]
    # params[:session][:password]
    #render 'new'
    
    user = User.find_by_email(params[:email].downcase)
    
    if user && user.authenticate(params[:password])
      sign_in user
      flash[:success] = 'Logged in'
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end 
  
  def destroy
    sign_out
    redirect_to root_url, notice: "Logged out!" 
  end

end
