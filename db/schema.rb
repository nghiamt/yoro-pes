# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160309102911) do

  create_table "games", force: :cascade do |t|
    t.integer  "player1id"
    t.integer  "player2id"
    t.integer  "result"
    t.integer  "player1belo"
    t.integer  "player1aelo"
    t.integer  "player2belo"
    t.integer  "player2aelo"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "team1id"
    t.integer  "team2id"
    t.integer  "player1goal"
    t.integer  "player2goal"
    t.integer  "tournament_id"
    t.string   "game_type"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "image_url"
    t.integer  "elo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.integer  "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.string   "time"
    t.string   "tournament_type"
    t.string   "rule"
    t.string   "url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
