json.array!(@items) do |item|
  json.extract! item, :id, :title, :description, :collection, :item_image
  json.url item_url(item, format: :json)
end
