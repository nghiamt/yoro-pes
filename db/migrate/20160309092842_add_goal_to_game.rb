class AddGoalToGame < ActiveRecord::Migration
  def change
    add_column :games, :player1goal, :integer
    add_column :games, :player2goal, :integer
  end
end
