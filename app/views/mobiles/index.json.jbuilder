json.array!(@mobiles) do |mobile|
  json.extract! mobile, :id, :name, :price
  json.url mobile_url(mobile, format: :json)
end
