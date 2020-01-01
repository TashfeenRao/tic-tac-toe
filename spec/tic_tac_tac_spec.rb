# frozen_string_literal: true

require './lib/board'
require './lib/game_status'
require './lib/player'

RSpec.describe 'Board' do
  let(:board) { Board.new }
  let(:player) { Player.new }

  describe '#input_to_index' do
    it 'input_to_index will return integer' do
      input = '1'
      expect(board.input_to_index(input)).to be_a(Integer)
    end
  end

  describe '#move' do
    it 'move will add current X or O in board' do
      brd = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
      p = player.current_player(brd, player)
      expect(board.move(brd, 0, p).to(eql([p.to_s, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])))
    end
  end
end
