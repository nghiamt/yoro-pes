json.array!(@players) do |player|
  json.extract! player, :id, :name, :image_url, :elo
  json.url player_url(player, format: :json)
end
