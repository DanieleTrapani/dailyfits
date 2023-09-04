class HomeController < ApplicationController
  def index
    if defined?(params)
      @location = params[:location]
    else
      @location = current_user.location
    end
    @weather = WeatherApi.get_day(0, @location)
    raise
  end

  def location_params
    params.require(:location).permit(:location)
  end
end
