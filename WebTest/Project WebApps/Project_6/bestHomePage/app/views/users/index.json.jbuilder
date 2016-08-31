json.array!(@users) do |user|
  json.extract! user, :id, :user_name, :location
  json.url user_url(user, format: :json)
end
