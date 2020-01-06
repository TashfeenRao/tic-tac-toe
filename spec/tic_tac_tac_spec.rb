# frozen_string_literal: true

require './lib/board'
require './lib/game_status'
require './lib/player'

RSpec.describe 'Board' do
  let(:board) { Board.new }
  let(:player) { Player.new }
  let(:game_over) { GameStatus.new }

  describe '#input_to_index' do
    it 'converts the user-input to integer' do
      input = '1'
      expect(board.input_to_index(input)).to be_a(Integer)
    end
  end

  describe '#game_over' do
    context 'checks if there similar item on the row' do
      it 'returns true if there are' do

        brd = ['X', 'X', 'X', ' ', ' ', ' ', ' ', ' ', ' ']
      
        expect(game_over.game_over?(brd, [0, 1, 2])).to eql(true)
      end
    end
  end

end
