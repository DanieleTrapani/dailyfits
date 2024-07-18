class HomeController < ApplicationController
  def index
    @location = current_user.location
    if params[:location].present?
      @location = params[:location]
      current_user.location = @location.titleize
      current_user.save
    end

    @weather = Rails.cache.fetch("today", expires_in: 1.day) do
      WeatherApi.get_day(0, @location)
    end
  end

  private

  def location_params
    params.require(:location).permit(:location)
  end
end
