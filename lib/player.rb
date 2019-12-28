# frozen_string_literal: true
#rubocop:disable all

require_relative '../lib/board.rb'
require_relative '../lib/game_status.rb'
class Player
  attr_accessor :player
  def initialize
    @player = 'X'
  end

  def Play(game_board, tic_tac_game, game_status, game_player)
    until game_status.game_over?(game_board.board, game_status.win_combinations)
      turn(game_board, game_player, tic_tac_game.name1, tic_tac_game.name2, game_status.win_combinations)
    end

    if game_status.won?(game_board.board, game_status.win_combinations)
      puts "Congratulations #{game_status.winner(game_board.board, tic_tac_game.name1, tic_tac_game.name2, game_status.win_combinations)} , You Won"
    end

    if game_status.draw?(game_board.board, game_status.win_combinations)
      puts "#{tic_tac_game.name1},#{tic_tac_game.name2} Game has been a Draw Well Played "
    end
  end

  def name_turn(board, player, name1, name2)
    if current_player(board, player) == 'X'
      name1
    else
      name2
    end
end

  def turn(game_board, player, name1, name2, _win_combinations)
    puts "Its #{name_turn(game_board.board, player, name1, name2)} turn, your Token is #{current_player(game_board.board, player)}"
    puts 'enter no to take position 1-9'
    input = gets.strip
    index = game_board.input_to_index(input)
    if game_board.valid_move?(game_board.board, index)
      game_board.move(game_board.board, index, player)
      game_board.display_board(game_board.board)
    else
      puts 'invalid move Type again'
     end
  end

  def turn_count(board)
    counter = 0
    board.each do |check|
      counter += 1 if check == 'X' || check == 'O'
    end
    counter
  end

  def current_player(board, _player)
    player = if turn_count(board).even?
               'X'
             else
               'O'
             end
  end
end

#rubocop:enable all