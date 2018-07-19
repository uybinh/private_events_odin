class EventsController < ApplicationController

  def index
    @events = Event.includes(:creator).all
  end


end
