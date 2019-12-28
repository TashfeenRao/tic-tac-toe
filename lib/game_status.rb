# frozen_string_literal: true

require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
class GameStatus
  attr_reader :win_combinations
  def initialize
    @win_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  end

  def game_over?(board, win_combinations)
    if draw?(board, win_combinations) || won?(board, win_combinations) || full?(board)
      true
    else
      false
    end
  end

  def full?(board)
    board.all? do |check|
      if check == 'X' || check == 'O'
        true
      else
        false
      end
    end
  end

  def draw?(board, win_combinations)
    if full?(board) && !won?(board, win_combinations)
      true
    else
      false
     end
   end

  def won?(board, win_combinations)
    win_combinations.detect do |check|
      if board[check[0]] == 'X' && board[check[1]] == 'X' && board[check[2]] == 'X'
        check
      elsif board[check[0]] == 'O' && board[check[1]] == 'O' && board[check[2]] == 'O'
        check
      else
        false
      end
    end
   end

  def winner(board, name1, name2, win_combinations)
    if won?(board, win_combinations)
      if board[won?(board, win_combinations)[0]] == 'X'
        name1
      else
        name2
      end
     end
  end
end