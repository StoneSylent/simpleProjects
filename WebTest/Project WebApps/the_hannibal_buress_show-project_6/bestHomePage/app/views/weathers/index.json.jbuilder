json.array!(@weathers) do |weather|
  json.extract! weather, :id, :location, :high, :low, :condition, :wind_speed, :loc_name, :sunrise, :sunset
  json.url weather_url(weather, format: :json)
end
