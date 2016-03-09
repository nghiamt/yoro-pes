class Tournament < ActiveRecord::Base
    has_many :games;
    TOURNAMENT_TYPES = ["SOLO", "DUO"]
end
