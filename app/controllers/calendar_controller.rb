# calendars are not (yet) a resource in the rails sense of thw word - we
# simply have a url like calendar/index to get the one and only calendar
# this demo serves up.
class CalendarController < ApplicationController
  layout :calendar_layout

  def index
  end

  private
    def calendar_layout
      if can? :create, Event 
        "calendar-admin"
      else
        "calendar-user"
      end
    end
end