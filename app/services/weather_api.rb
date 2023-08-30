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
    max.each_with_index do |_temp, index|
      mean_temp[index] = ((max[index] + min[index]) / 2.0).round(1)
    end

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

  def self.temp_ranges
    {
      "Extreme cold" => (-273..0),
      "Cold" => (0..15),
      "Mild" => (15..22),
      "Hot" => (22..30),
      "Very Hot" => (30..50)
    }
  end

  def self.wind_ranges
    {
      "None" => (0..1),
      "Light" => (1..20),
      "Moderate" => (20..38),
      "Strong" => (38..49),
      "Storm" => (49..70)
    }
  end

  def self.precip_ranges
    {
      "Clear" => (0.0..0.1),
      "Very light" => (0.2..1.0),
      "Light" => (1.1..10.0),
      "Heavy" => (10.1..30.0),
      "Very Heavy" => (30.1..200.1)
    }
  end

  def self.get_tag(hash, value)
    hash.values.any? do |range|
      return hash.key(range) if range.include?(value)
    end
  end

  def create_tag()
    temp_label = Weather.Api.get_tag(WeatherApi.temp_ranges, )
    wind_label = WeatherApi.get_tag(WeatherApi.wind_ranges, )
    precip_label = WeatherApi.get_tag(WeatherApi.precip_ranges, )

    Tag.new(temperature: temp_label, wind: wind_label, rain: precip_label)
  end
end
