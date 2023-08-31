class HomeController < ApplicationController
  def index
    @weather = WeatherForecast.new(current_user.location).today
  end
end
