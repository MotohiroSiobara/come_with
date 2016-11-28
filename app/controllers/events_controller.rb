class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :show, :update, :join]
  before_action :authenticate

  def index
    @search = Event.search(params[:q])
    @events = @search.result.reorder("created_at DESC").page(params[:page]).per(20)
    result = @search.result.includes(:users)
    @title = params[:q][:title_cont] if params[:q].present?
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    event = Event.new(event_params)
    if event.save
      current_user.holding_events << event
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
    @event.participants << current_user
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
