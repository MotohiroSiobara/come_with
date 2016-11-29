class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :show, :update, :join, :destroy, :remove]
  before_action :authenticate

  def index
    @search = Event.search(params[:q])
    if params[:q].present?
      @genre = params[:q][:genre_id_eq]
      @title = params[:q][:title_cont]
    end
    @events = @search.result.reorder("created_at DESC").page(params[:page]).per(20)
  end

  def new
    @event = Event.new
    @genre = Genre.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      current_user.holding_events << @event
      redirect_to events_path
    else
      render :new
    end
  end

  def update
    binding.pry
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def join
    @event.participants << current_user
    @event.people_counter("up")
  end

  def destroy
    @event.destroy
    redirect_to user_path(current_user)
  end

  def remove
    EventsParticipantsRelationship.find_by(user_id: current_user.id, event_id: @event.id).destroy
    @event.people_counter("down")
    redirect_to user_path(current_user)
  end

  private

  def event_params
    if params[:event][:result] == "1"
      params[:event][:recruitment_numbers] = 0
    end
    params.require(:event).permit(:title, :url, :image, :description, :schedule, :recruitment_numbers, :participant_count, :genre_id, :result)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
