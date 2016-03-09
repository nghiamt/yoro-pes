class Player < ActiveRecord::Base
    has_many :host_games, class_name: "Game", foreign_key: "player1id"
    has_many :guest_games, class_name: "Game", foreign_key: "player2id"
    
    def games
        (host_games.to_a | guest_games.to_a).sort_by &:created_at
    end
end
