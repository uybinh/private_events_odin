class EventsController < ApplicationController

  def index
    @past = Event.past.includes(:creator)
    @upcoming = Event.upcoming.includes(:creator)
  end

  def show
    @event = Event.find(params[:id])
  end

end
