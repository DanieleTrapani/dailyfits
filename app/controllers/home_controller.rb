class HomeController < ApplicationController
  def index
    @weather = WeatherApi.get_day(0, current_user.location)
  end
end
