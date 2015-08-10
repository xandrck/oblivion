json.array!(@storages) do |storage|
  json.extract! storage, :id, :title, :url
  json.url storage_url(storage, format: :json)
end
