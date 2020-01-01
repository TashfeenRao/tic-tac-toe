# frozen_string_literal: true

require './lib/board'
require './lib/game_status'
require './lib/player'

RSpec.describe 'Board' do
  let(:board) { Board.new }

  describe '#input_to_index' do
    it 'input_to_index will return integer' do
      input = '1'
      expect(board.input_to_index(input)).to be_a(Integer)
    end
  end
end
