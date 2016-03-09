class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :time
      t.string :tournament_type
      t.string :rule
      t.string :url

      t.timestamps null: false
    end
  end
end
