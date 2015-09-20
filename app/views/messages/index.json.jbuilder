json.array!(@messages) do |message|
  json.extract! message, :id, :text, :status, :verified
  json.url message_url(message, format: :json)
end
