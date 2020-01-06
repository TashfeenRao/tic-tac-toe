# frozen_string_literal: true

require './lib/board'
require './lib/game_status'
require './lib/player'

RSpec.describe 'Board' do
  let(:board) { Board.new }
  let(:plyr) { Player.new }

  describe '#input_to_index' do
    it 'input_to_index will return integer' do
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
end
