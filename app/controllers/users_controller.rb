class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user,   only: [:show, :edit, :update ]
  before_filter :admin_user,     only: [:index, :destroy, :create, :new]

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
   @user = User.new(params[:user])
   if @user.save
     sign_in @user
     flash[:success] = "Добро пожаловать!"
     redirect_to @user
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
    @user=User.find(params[:id])
    if current_user?(@user)
      flash[:error] = "You can't destroy yourself."
      redirect_to users_path
    else
        @user.destroy
        flash[:success] = "User destroyed."
        redirect_to users_path
    end
  end

  private

  def registered_user
    if signed_in?
      flash[:notice] = "Not available page for signed in user."
      redirect_to root_path
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
