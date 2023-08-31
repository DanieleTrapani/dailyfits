class WeatherForecast
  # WMO Weather interpretation codes (WW)
  # Code	Description
  # 0	Clear sky
  # 1, 2, 3	Mainly clear, partly cloudy, and overcast
  # 45, 48	Fog and depositing rime fog
  # 51, 53, 55	Drizzle: Light, moderate, and dense intensity
  # 56, 57	Freezing Drizzle: Light and dense intensity
  # 61, 63, 65	Rain: Slight, moderate and heavy intensity
  # 66, 67	Freezing Rain: Light and heavy intensity
  # 71, 73, 75	Snow fall: Slight, moderate, and heavy intensity
  # 77	Snow grains
  # 80, 81, 82	Rain showers: Slight, moderate, and violent
  # 85, 86	Snow showers slight and heavy
  # 95	Thunderstorm: Slight or moderate
  # 96, 99	Thunderstorm with slight and heavy hail
  WEATHER_CODES = {
    0 => { description: "Clear", icon: "wi-day-sunny" },
    1 => { description: "Mainly clear", icon: "wi-day-cloudy" },
    2 => { description: "Partly cloudy", icon: "wi-cloudy" },
    3 => { description: "Overcast", icon: "wi-cloudy" },
    45 => { description: "Fog", icon: "wi-fog" },
    48 => { description: "Rime fog", icon: "wi-fog" },
    51 => { description: "Light Drizzle", icon: "wi-sprinkle" },
    53 => { description: "Moderate Drizzle", icon: "wi-sprinkle" },
    55 => { description: "Heavy Drizzle", icon: "wi-sprinkle" },
    56 => { description: "Light Freezing drizzle", icon: "wi-sprinkle" },
    57 => { description: "Heavy Freezing drizzle", icon: "wi-sprinkle" },
    61 => { description: "Slight Rain", icon: "wi-rain" },
    63 => { description: "Moderate Rain", icon: "wi-rain" },
    65 => { description: "Heavy Rain", icon: "wi-rain" },
    66 => { description: "Light Freezing rain", icon: "wi-rain" },
    67 => { description: "Heavy Freezing rain", icon: "wi-rain" },
    71 => { description: "Light Snow", icon: "wi-snow" },
    73 => { description: "Moderate Snow", icon: "wi-snow" },
    75 => { description: "Heavy Snow", icon: "wi-snow" },
    77 => { description: "Snow grains", icon: "wi-snow" },
    80 => { description: "Light Rain showers", icon: "wi-showers" },
    81 => { description: "Moderate Rain showers", icon: "wi-showers" },
    82 => { description: "Heavy Rain showers", icon: "wi-showers" },
    85 => { description: "Light Snow showers", icon: "wi-snow" },
    86 => { description: "Heavy Snow showers", icon: "wi-snow" },
    95 => { description: "Thunderstorm", icon: "wi-thunderstorm" },
    96 => { description: "Thunderstorm with Light Hail", icon: "wi-thunderstorm" },
    99 => { description: "Thunderstorm with Heavy Hail", icon: "wi-thunderstorm" }
  }
  def initialize(location)
    @location = location
    @api = WeatherApi.api_call(location)
  end

  def today
    {
      date: Date.parse(@api["time"][0]),
      weathercode: @api["weathercode"][0],
      rainfall: rainfall(@api["precipitation_sum"][0]),
      wind: wind(@api["windspeed_10m_max"][0]),
      temp: temp(@api["apparent_temperature_min"][0], @api["apparent_temperature_max"][0]),
      icon: WEATHER_CODES[@api["weathercode"][0]][:icon],
      description: WEATHER_CODES[@api["weathercode"][0]][:description],
      location: @location
    }
  end

  private

  def rainfall(value)
    tags = WeatherApi.tag_names[:rain]
    tags.values.any? do |range|
      return tags.key(range) if range.include?(value)
    end
  end

  def temp(min, max)
    tags = WeatherApi.tag_names[:temp]
    mean_temp = ((max + min) / 2.0).round(1)
    tags.values.any? do |range|
      return tags.key(range) if range.include?(mean_temp)
    end
  end

  def wind(value)
    tags = WeatherApi.tag_names[:wind]
    tags.values.any? do |range|
      return tags.key(range) if range.include?(value)
    end
  end
end
