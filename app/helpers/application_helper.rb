module ApplicationHelper
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

  def weather_icon(weathercode)
    WEATHER_CODES[weathercode][:icon]
  end

  def weather_description(weathercode)
    WEATHER_CODES[weathercode][:description]
  end
end
