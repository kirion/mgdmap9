class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  def current_user
    @current_user ||= User.find_by_remember_token!(cookies[:remember_token]) if cookies[:remember_token]
  end

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end
end
