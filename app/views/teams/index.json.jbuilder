json.array!(@teams) do |team|
  json.extract! team, :id, :name, :logo, :rank
  json.url team_url(team, format: :json)
end
