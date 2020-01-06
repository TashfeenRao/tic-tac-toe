# frozen_string_literal: true

require './lib/board'
require './lib/game_status'
require './lib/player'

RSpec.describe 'Board' do
  let(:board) { Board.new }
  let(:plyr) { Player.new }
  let(:win_combi) { GameStatus.new }

  describe '#input_to_index' do
    it 'converts the user-input to integer' do
      input = '1'
      expect(board.input_to_index(input)).to be_a(Integer)
    end
  end

  describe '#initialize' do
    it 'it will return empty board' do
      expect(board.board).to eql([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    end
  end

  describe '#valid_move?' do
    it 'it will return true if move is valid' do
      brd = [' ', ' ', 'X', ' ', ' ', ' ', ' ', ' ', ' ']
      expect(board.valid_move?(brd, 3)).to eql(true)
    end
    it 'it will return false if move is invalid' do
      brd = [' ', ' ', 'X', ' ', ' ', ' ', ' ', ' ', ' ']
      expect(board.valid_move?(brd, 2)).to eql(false)
    end
  end

  describe '#initialize' do
    it 'defines a win_combinations with arrays for each win combination' do
      expect(win_combi.win_combinations).to eql([[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]])
    end
  end
end
