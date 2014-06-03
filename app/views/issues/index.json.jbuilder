json.array!(@issues) do |issue|
  json.extract! issue, :id, :title, :description, :state, :resolution, :thermostat_id
  json.url issue_url(issue, format: :json)
end
