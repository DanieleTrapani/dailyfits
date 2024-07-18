class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @disable_nav = true
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
end
