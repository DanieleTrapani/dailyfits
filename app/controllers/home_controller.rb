class HomeController < ApplicationController
  def index
    new_loc = params[:location]
    if new_loc.nil?
      @location = current_user.location
    else
      @location = new_loc.titleize
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
