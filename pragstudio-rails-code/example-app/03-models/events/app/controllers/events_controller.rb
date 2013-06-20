class EventsController < ApplicationController

  def index
    @time = Time.now
    @events = ['BugSmash', 'Hackthon', 'Kata Camp']
  end

end
