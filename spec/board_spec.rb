# frozen_string_literal: true

require_relative './lib/board'
require_relative './lib/game_status'
require_relative './lib/player'

RSpec.describe 'Board' do
  let(:board) { Board.new }
  let(:plyr) { Player.new }
  let(:game) { GameStatus.new }
  let(:win) { [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] }

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

  describe '#move' do
    it "places player's to the position specified" do
      brd = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
      expect(board.move(brd, 2, 'X')).to eql([' ', ' ', 'X', ' ', ' ', ' ', ' ', ' ', ' '])
    end
  end

  describe '#position_taken?' do
    it 'returns true if the board cell occupies with "X" or "O" token' do
      brd = [' ', 'X', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
      expect(board.position_taken?(brd, 1)).to eql(true)
    end
    it 'returns false if the board cell is empty' do
      brd = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
      expect(board.position_taken?(brd, 3)).to eql(false)
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
end
