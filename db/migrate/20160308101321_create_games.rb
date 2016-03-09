class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player1id
      t.integer :player2id
      t.integer :result
      t.integer :player1belo
      t.integer :player1aelo
      t.integer :player2belo
      t.integer :player2aelo

      t.timestamps null: false
    end
  end
end
