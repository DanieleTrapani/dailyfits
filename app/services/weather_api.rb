class WeatherApi
  def self.api_call(long, lat)
    HTTParty.get("https://api.open-meteo.com/v1/forecast?latitude=#{lat}&longitude=#{long}&daily=weathercode,apparent_temperature_max,apparent_temperature_min,precipitation_sum,windspeed_10m_max&timezone=Europe%2FBerlin")
  end
end
