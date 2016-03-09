json.array!(@tournaments) do |tournament|
  json.extract! tournament, :id, :name, :time, :type, :rule, :url
  json.url tournament_url(tournament, format: :json)
end
