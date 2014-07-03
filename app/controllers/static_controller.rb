class StaticController < ApplicationController
  def home
    if not signed_in?
      redirect_to new_session_path
    end
    
  end
end
