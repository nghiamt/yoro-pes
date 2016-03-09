class Game < ActiveRecord::Base
    belongs_to :player1, class_name: "Player", foreign_key: "player1id"
    belongs_to :player2, class_name: "Player", foreign_key: "player2id"
    belongs_to :team1, class_name: "Team", foreign_key: "team1id"
    belongs_to :team2, class_name: "Team", foreign_key: "team2id"
    belongs_to :tournament
    after_create :set_belo_and_aelo_and_result
    
    def set_belo_and_aelo_and_result
      self.result = if self.player1goal > self.player2goal
        1
      elsif self.player1goal == self.player2goal
        0
      else
        -1
      end
      self.player1belo = player1.elo
      self.player2belo = player2.elo
      p1 = Elo::Player.new rating: self.player1belo
      p2 = Elo::Player.new rating: self.player2belo
      if result == -1
          p1.loses_from p2
      elsif result == 0
          p1.plays_draw p2
      else
          p1.wins_from p2
      end
      self.player1aelo = p1.rating
      self.player2aelo = p2.rating
      self.save
      player1.update_attributes elo: self.player1aelo
      player2.update_attributes elo: self.player2aelo
    end
    
    def result_in_text
      player1goal.to_s + " - " + player2goal.to_s
    end
end
