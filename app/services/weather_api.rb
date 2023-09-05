class WeatherApi
  @@tag_names = {
    temp: {
      "Extreme cold" => (-273..0),
      "Cold" => (0..15),
      "Mild" => (15..22),
      "Hot" => (22..30),
      "Very Hot" => (30..50)
    },
    wind: {
      "None" => (0..1),
      "Light" => (1..20),
      "Moderate" => (20..38),
      "Strong" => (38..49),
      "Storm" => (49..70)
    },
    rain: {
      "Clear" => (0.0..0.1),
      "Very light" => (0.2..1.0),
      "Light" => (1.1..10.0),
      "Heavy" => (10.1..30.0),
      "Very Heavy" => (30.1..200.1)
    }
  }

  def self.tag_names
    @@tag_names
  end

  def self.api_call(location)
    # Retrieves coordinates from location
    first_result = Geocoder.search(location).first

    # Validates there is a proper API response. Defaults to Amsterdam in case of improper response.
    first_result = Geocoder.search("Amsterdam").first if first_result.nil?

    coordinates = first_result.coordinates

    # coordinates = [52.3676, 4.9041]
    # Retrieves daily weather data from coordinates
    response = HTTParty.get("https://api.open-meteo.com/v1/forecast?latitude=#{coordinates[0]}&longitude=#{coordinates[1]}&daily=weathercode,apparent_temperature_max,apparent_temperature_min,precipitation_sum,windspeed_10m_max&timezone=Europe%2FBerlin")

    return response["daily"]
  end

  def self.forecast(location)
    data = api_call(location)
    {
      days: data["time"],
      weathercode: data["weathercode"],
      precipitation: data["precipitation_sum"],
      windspeed: data["windspeed_10m_max"],
      temp: mean_temp(data["apparent_temperature_min"], data["apparent_temperature_max"])
    }
  end

  def self.get_day(index, location)
    data = api_call(location)
    {
      day: data["time"][index],
      weathercode: data["weathercode"][index],
      precipitation: data["precipitation_sum"][index],
      windspeed: data["windspeed_10m_max"][index],
      temp: mean_temp(data["apparent_temperature_min"], data["apparent_temperature_max"])[index]
    }
  end

  def self.create_tag(day)
    {
      temperature: tag_names[:temp].keys.select { |key| tag_names[:temp][key].include? day[:temp] }[0],
      rain: tag_names[:rain].keys.select { |key| tag_names[:rain][key].include? day[:precipitation] }[0],
      wind: tag_names[:wind].keys.select { |key| tag_names[:wind][key].include? day[:windspeed] }[0]
    }
  end

  def self.mean_temp(min, max)
    mean_temp = []
    max.each_with_index do |_temp, index|
      mean_temp[index] = ((max[index] + min[index]) / 2.0).round(1)
    end

    mean_temp
  end
end
