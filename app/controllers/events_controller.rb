class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end
  
  def index
    @events = Event.paginate(page: params[:page])
  end

  def new
    @event = Event.new(params[:event])
  end
  
  def create
   @event = Event.new(params[:event])
   if @event.save
     flash[:success] = "Событие успешно добавлено в базу"
     redirect_to @event
   else
     render 'new'
   end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:success] = "Информация о событии обновлена"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
     @event=Event.find(params[:id])
     @event.destroy
     flash[:success] = "Информация о событии удалена из базы"
     redirect_to events_path
  end
end
