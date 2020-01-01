# frozen_string_literal: true

require './lib/board'
require './lib/game_status'
require './lib/player'

RSpec.describe 'Board' do
  let(:board) { Board.new }
  let(:plyr)  { Player.new }

  describe '#input_to_index' do
    it 'input_to_index will return integer' do
      input = '1'
      expect(board.input_to_index(input)).to be_a(Integer)
    end
  end

  describe '#position_taken?' do
  it 'position_taken? will return integer' do
     brd = [" "," ","X"," "," "," "," "," "," "]
     index = 2
    expect(board.position_taken?(brd,index)).to be_a(true)
  end
 end
end