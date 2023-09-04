class HomeController < ApplicationController
  def index
    new_loc = params[:location]
    if new_loc.nil?
      @location = "Amsterdam"
    else
      @location = new_loc
    end
    current_user[:location] = @location
    current_user.save
    @weather = WeatherApi.get_day(0, @location)
  end

  private

  def location_params
    params.require(:location).permit(:location)
  end
end
