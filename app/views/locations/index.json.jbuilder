json.array!(@locations) do |location|
  json.extract! location, :id, :lat_lng
  json.url location_url(location, format: :json)
end
