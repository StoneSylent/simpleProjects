json.array!(@bookmarks) do |bookmark|
  json.extract! bookmark, :id, :user_name, :url, :title
  json.url bookmark_url(bookmark, format: :json)
end
