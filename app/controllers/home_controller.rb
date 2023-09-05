class HomeController < ApplicationController
  def index
    @location = current_user.location
    if params[:location].present?
      @location = params[:location]
      current_user.location = @location.titleize
      current_user.save
    end

    @weather = WeatherApi.get_day(0, @location)
  end

  private

  def location_params
    params.require(:location).permit(:location)
  end
end
