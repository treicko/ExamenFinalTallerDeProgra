json.array!(@clients) do |client|
  json.extract! client, :id, :name, :lastName, :id_user
  json.url client_url(client, format: :json)
end
