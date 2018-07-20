class EventsController < ApplicationController

  def index
    @past = Event.past.includes(:creator)
    @upcoming = Event.upcomping.includes(:creator)
  end

  def show
    @event = Event.find(params[:id])
  end


end
