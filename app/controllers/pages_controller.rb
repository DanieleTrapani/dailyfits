class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @disable_nav = true
  end

  def forecast
    @location = current_user.location
    @forecast = WeatherApi.forecast(@location)
  end

  def dashboard
    @outfits = current_user.outfits.order(created_at: :desc)
  end
end
