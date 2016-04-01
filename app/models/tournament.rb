class Tournament < ActiveRecord::Base
    has_many :games;
    belongs_to :firstplace, class_name: "Player", foreign_key: "first"
    belongs_to :secondplace, class_name: "Player", foreign_key: "second"
    belongs_to :thirdplace, class_name: "Player", foreign_key: "third"
    TOURNAMENT_TYPES = ["SOLO", "DUO"]
end
