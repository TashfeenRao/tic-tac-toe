# frozen_string_literal: true

require_relative './lib/board'
require_relative './lib/game_status'
require_relative './lib/player'

RSpec.describe 'GameStatus' do
  let(:board) { Board.new }
  let(:plyr) { Player.new }
  let(:game) { GameStatus.new }
  let(:display) { TicTacToe.new }
  let(:win) { [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] }

  describe '#initialize' do
    it 'defines a win_combinations with arrays for each win combination' do
      expect(game.win_combinations).to eql(win)
    end
  end

  describe '#won?' do
    it 'it will return winning combination if board having winning combinations' do
      brd = ['X', 'X', 'X', ' ', ' ', ' ', ' ', ' ', ' ']
      expect(game.won?(brd, win)).to eql([0, 1, 2])
    end
    it 'it will return winning combination if board having winning combinations' do
      brd = [' ', ' ', ' ', 'X', 'X', 'X', ' ', ' ', ' ']
      expect(game.won?(brd, win)).to eql([3, 4, 5])
    end
    it 'it will return winning combination if board having winning combinations' do
      brd = [' ', ' ', ' ', ' ', ' ', ' ', 'X', 'X', 'X']
      expect(game.won?(brd, win)).to eql([6, 7, 8])
    end
    it 'it will return winning combination if board having winning combinations' do
      brd = ['O', ' ', ' ', 'O', ' ', ' ', 'O', ' ', ' ']
      expect(game.won?(brd, win)).to eql([0, 3, 6])
    end
    it 'it will return winning combination if board having winning combinations' do
      brd = [' ', 'O', ' ', ' ', 'O', ' ', ' ', 'O', ' ']
      expect(game.won?(brd, win)).to eql([1, 4, 7])
    end
    it 'returns winning combination for diagonal top left to bottom right' do
      brd = ['X', ' ', ' ', ' ', 'X', ' ', ' ', ' ', 'X']
      expect(game.won?(brd, win)).to eql([0, 4, 8])
    end
    it 'returns winning combination for diagonal top right to bottom left' do
      brd = ['', ' ', 'X', ' ', 'X', ' ', 'X', ' ', ' ']
      expect(game.won?(brd, win)).to eql([2, 4, 6])
    end
    it 'it will return nil if winning combinations are not provide' do
      brd = [' ', 'O', ' ', ' ', 'X', ' ', ' ', 'O', ' ']
      expect(game.won?(brd, win)).to eql(nil)
    end
  end

  describe '#draw?' do
    it 'it will return true if board is full and not have winning combinatons' do
      brd = %w[X O X O X O O X O]
      expect(game.draw?(brd, win)).to eql(true)
    end
    it 'it will return false if board is full and having winning combinations' do
      brd = %w[X O X O X O X X X]
      expect(game.draw?(brd, win)).to eql(false)
    end
  end

  describe '#full?' do
    it 'returns true if the board array fills up with players tokens' do
      brd = %w[X O X O X X O X O]
      expect(game.full?(brd)).to eql(true)
    end
    it 'returns false if the board array is not full' do
      brd = ['X', 'O', 'X', 'O', 'X', ' ', 'O', 'X', 'O']
      expect(game.full?(brd)).to eql(false)
    end
  end

  describe '#game_over?' do
    it 'returns true if the board is full' do
      brd = %w[X O X O X X O X O]
      expect(game.game_over?(brd, win)).to eql(true)
    end
    it 'returns true if the game is won' do
      brd = ['X', 'X', 'X', ' ', ' ', ' ', ' ', ' ', ' ']
      expect(game.game_over?(brd, win)).to eql(true)
    end
    it 'return true if the game is a draw' do
      brd = %w[X O X O X X O X O]
      expect(game.game_over?(brd, win)).to eql(true)
    end
  end
end
