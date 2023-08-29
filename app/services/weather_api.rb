class WeatherApi
  def self.api_call(location)
    # Retrieves coordinates from location
    coordinates = Geocoder.search(location).first.coordinates

    # Retrieves daily weather data from coordinates
    response = HTTParty.get("https://api.open-meteo.com/v1/forecast?latitude=#{coordinates[0]}&longitude=#{coordinates[1]}&daily=weathercode,apparent_temperature_max,apparent_temperature_min,precipitation_sum,windspeed_10m_max&timezone=Europe%2FBerlin")
    daily = response["daily"]

    # Process data to give the wanted parameters
    mean_temp = mean_temp(daily["apparent_temperature_min"], daily["apparent_temperature_max"])
    $result = data_refactor(daily, mean_temp)
  end

  def self.mean_temp(min, max)
    mean_temp = []
    max.each_with_index { |_temp, index|
      mean_temp[index] = ((max[index] + min[index]) / 2.0).round(1)
    }
    mean_temp
  end

  def self.data_refactor(daily, mean_temp)
    {
      time: daily["time"],
      weathercode: daily["weathercode"],
      precipitation: daily["precipitation_sum"],
      windspeed: daily["windspeed_10m_max"],
      mean_temp: mean_temp
    }
  end
end
