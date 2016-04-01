class AddResultToTournament < ActiveRecord::Migration
  def change
    add_column :tournaments, :first, :integer
    add_column :tournaments, :second, :integer
    add_column :tournaments, :third, :integer
  end
end
