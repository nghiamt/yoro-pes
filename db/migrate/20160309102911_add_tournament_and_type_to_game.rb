class AddTournamentAndTypeToGame < ActiveRecord::Migration
  def change
    add_column :games, :tournament_id, :integer
    add_column :games, :game_type, :string
  end
end
