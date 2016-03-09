class Team < ActiveRecord::Base
    LEVEL = [(8..19).to_a, (4..12).to_a, (1..6).to_a]
end
