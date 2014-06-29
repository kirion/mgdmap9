class SessionsController < ApplicationController
  before_filter :registered_user, only: [:new]

  def new
  end

  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_back_or root_url
    else
      flash.now[:error] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  private

  def registered_user
    if signed_in?
      store_location
      redirect_to root_path, notice: "Not available page for signed in user."
    end
  end
end
