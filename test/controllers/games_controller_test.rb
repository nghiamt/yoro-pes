require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post :create, game: { player1aelo: @game.player1aelo, player1belo: @game.player1belo, player1id: @game.player1id, player2aelo: @game.player2aelo, player2belo: @game.player2belo, player2id: @game.player2id, result: @game.result }
    end

    assert_redirected_to game_path(assigns(:game))
  end

  test "should show game" do
    get :show, id: @game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game
    assert_response :success
  end

  test "should update game" do
    patch :update, id: @game, game: { player1aelo: @game.player1aelo, player1belo: @game.player1belo, player1id: @game.player1id, player2aelo: @game.player2aelo, player2belo: @game.player2belo, player2id: @game.player2id, result: @game.result }
    assert_redirected_to game_path(assigns(:game))
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete :destroy, id: @game
    end

    assert_redirected_to games_path
  end
end
