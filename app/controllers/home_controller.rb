class HomeController < ApplicationController
  def index
    new_loc = params[:location]
    if new_loc.nil?
      @location = current_user.location
    else
      @location = new_loc
    end
    @weather = WeatherApi.get_day(0, @location)
  end

  def location_params
    params.require(:location).permit(:location)
  end
end
