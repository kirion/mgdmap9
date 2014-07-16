class HousesController < ApplicationController
  def show
    @house = House.find(params[:id])   
    @events = @house.events
  end
  
  def index
    @houses = House.paginate(page: params[:page]).search(params[:search])
  end

  def new
    @house = House.new(params[:house])
  end
  
  def create
   @house = House.new(params[:house])
   if @house.save
     flash[:success] = "Дом успешно добавлен в базу"
     redirect_to @house
   else
     render 'new'
   end
  end

  def edit
    @house=House.find(params[:id])
  end

  def update
    @house=House.find(params[:id])
    if @house.update_attributes(params[:house])
      flash[:success] = "Информация о доме обновлена"
      redirect_to @house
    else
      render 'edit'
    end
  end

  def destroy
     @house=House.find(params[:id])
     @house.destroy
     flash[:success] = "Информация о доме удалена из базы"
     redirect_to database_path
  end


end
