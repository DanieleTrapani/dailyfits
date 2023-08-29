class WeatherApi
  def self.api_call(long, lat)
    response = HTTParty.get("https://api.open-meteo.com/v1/forecast?latitude=#{lat}&longitude=#{long}&daily=weathercode,apparent_temperature_max,apparent_temperature_min,precipitation_sum,windspeed_10m_max&timezone=Europe%2FBerlin")
    daily = response["daily"]

    max_temps = daily["apparent_temperature_max"]
    min_temps = daily["apparent_temperature_min"]
    mean_temps = []

    max_temps.each_with_index { |_temp, index|
      mean_temps[index] = ((max_temps[index] + min_temps[index]) / 2.0).round(1)
    }

    $result = {
      time: daily["time"],
      weathercode: daily["weathercode"],
      precipitation: daily["precipitation_sum"],
      windspeed: daily["windspeed_10m_max"],
      mean_temp: mean_temps
    }
  end
end
