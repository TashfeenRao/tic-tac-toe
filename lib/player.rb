# frozen_string_literal: true

require_relative '../lib/board.rb'
require_relative '../lib/game_status.rb'
class Player
  attr_reader :player
  def initialize
    @player = 'X'
  end

  def play(game, tic_game, game_status, game_player)
    until game_status.game_over?(game.board, game_status.win_combinations)
      tic_game.turn(game, game_player, tic_game.name1, tic_game.name2, game_status.win_combinations, tic_game)
    end
    if game_status.won?(game.board, game_status.win_combinations)
      return "You Won #{game_status.winner(game.board, tic_game.name1, tic_game.name2, game_status.win_combinations)}"
    end

    return unless game_status.draw?(game.board, game_status.win_combinations)

    "#{tic_game.name1},#{tic_game.name2} Game has been a Draw Well Played "
  end

  def name_turn(board, player, name1, name2)
    if current_player(board, player) == 'X'
      name1
    else
      name2
    end
  end

  def turn_count(board)
    counter = 0
    board.each do |check|
      counter += 1 if check.include?('X') || check.include?('O')
    end
    counter
  end

  def current_player(board, _player)
    if turn_count(board).even?
      'X'
    else
      'O'
    end
  end
end
