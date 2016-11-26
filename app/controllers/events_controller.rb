class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :show, :create, :update, :join]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    event = Event.new(event_params)
    if event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  def join
    @event.users << current_user
    @event.counter_up
  end

  private

  def event_params
    params.require(:event).permit(:title, :url, :image, :description, :schedule, :recruitment_numbers, :participants)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
