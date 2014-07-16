class DatabaseController < ApplicationController
  def index
    @houses = House.all 
  end
  
  def search
    @houses = House.search(params[:search])
  end
  

end
