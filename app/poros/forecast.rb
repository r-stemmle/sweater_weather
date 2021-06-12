class Forecast
  attr_reader :id

  def initialize(data)
    @id = 'null'
    @current_weather = data[:current]
    @daily_weather = data[:daily].first(5)
    @hourly_weather = data[:hourly].first(8)
  end

  def current_weather
    {
      datetime: Time.at(@current_weather[:dt]),
      sunrise: Time.at(@current_weather[:sunrise]),
      sunset: Time.at(@current_weather[:sunset]),
      temperature: kelvin_to_fh(@current_weather[:temp]),
      feels_like: kelvin_to_fh(@current_weather[:feels_like]),
      humidity: @current_weather[:humidity],
      uvi: @current_weather[:uvi],
      visibility: @current_weather[:visibility],
      conditions: @current_weather[:weather].first[:description],
      icon: @current_weather[:weather].first[:icon]
    }
  end

  def hourly_weather
    @hourly_weather.map do |hour|
      {
        time: Time.at(hour[:dt]).strftime("%R"),
        temperature: kelvin_to_fh(hour[:temp]),
        conditions: hour[:weather].first[:description],
        icon: hour[:weather].first[:icon]
      }
    end
  end

  def daily_weather
    @daily_weather.map do |day|
      {
        date: Time.at(day[:dt]).to_date,
        sunrise: Time.at(day[:sunrise]),
        sunset: Time.at(day[:sunset]),
        max_temp: kelvin_to_fh(day[:temp][:max]),
        min_temp: kelvin_to_fh(day[:temp][:min]),
        conditions: day[:weather].first[:description],
        icon: day[:weather].first[:icon]
      }
    end
  end

  def kelvin_to_fh(kelvin)
    f = (kelvin - 273.15) * (9/5) + 32
    f.round(2)
  end
end
