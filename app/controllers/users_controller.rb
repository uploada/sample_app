class UsersController < ApplicationController
 
  before_filter :signed_in_user, only: [:edit, :update, :index, :destroy, :following, :followers]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy 

  def index
    #@users = User.all
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end  

  def new
    if signed_in?
      return redirect_to root_path #redirection does not return in rails
    end
    @user = User.new
  end

  def create
    if signed_in?
      return redirect_to root_path
    end
    @user = User.new(params[:user])
    if @user.save
       sign_in @user
       flash[:success] = "welcome to the Sample App!"
       redirect_to @user
       #redirect_to user_path(@user)
       #redirect_to action: 'show', id: @user.id
    else
      render 'new'
    end
  end
 
  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id]).destroy
    if current_user?(user)
      return redirect_to root_path
    end 
    flash[:success] = "User destroyed"
    redirect_to users_path
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end







  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end

    def admin_user
      redirect_to root_path unless current_user.admin?
    end
end
