json.array!(@settings) do |setting|
  json.extract! setting, :id, :background, :fontSize, :fontColor, :fontFamily, :user_name
  json.url setting_url(setting, format: :json)
end
