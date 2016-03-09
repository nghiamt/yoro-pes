json.array!(@games) do |game|
  json.extract! game, :id, :player1id, :player2id, :result, :player1belo, :player1aelo, :player2belo, :player2aelo
  json.url game_url(game, format: :json)
end
