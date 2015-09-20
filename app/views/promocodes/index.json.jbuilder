json.array!(@promocodes) do |promocode|
  json.extract! promocode, :id, :codetext, :timesused, :discount_value, :validity
  json.url promocode_url(promocode, format: :json)
end
