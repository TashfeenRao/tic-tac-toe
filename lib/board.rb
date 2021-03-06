# frozen_string_literal: true

require_relative '../lib/player.rb'
require_relative '../lib/game_status.rb'
class Board
  attr_reader :board
  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(board, index, player)
    board[index] = player.current_player(board, player.player)
  end

  def position_taken?(board, index)
    if board[index] == 'X' || board[index] == 'O'
      true
    else
      false
    end
  end

  def valid_move?(board, index)
    if position_taken?(board, index) == false && index.between?(0, 8)
      true
    else
      false
    end
  end
end
