class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home landing]

  def landing
    @disable_nav = true
  end

  def home
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

  def forecast
    @location = current_user.location
    # @forecast = WeatherApi.forecast(@location)
    @forecast = Rails.cache.fetch("forecast", expires_in: 1.day) do
      WeatherApi.forecast(@location)
    end
  end

  def dashboard
    @outfits = current_user.outfits.order(created_at: :desc)
  end

  private

  def location_params
    params.require(:location).permit(:location)
  end
end
