class AddTeamToGame < ActiveRecord::Migration
  def change
    add_column :games, :team1id, :integer
    add_column :games, :team2id, :integer
  end
end
