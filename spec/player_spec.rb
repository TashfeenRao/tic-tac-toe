# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/game_status'
require_relative '../lib/player'

RSpec.describe 'Player' do
  let(:board) { Board.new }
  let(:plyr) { Player.new }
  let(:game) { GameStatus.new }
  let(:display) { TicTacToe.new }
  let(:win) { [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] }

  describe '#current_player' do
    it 'will gives the current player Token' do
      brd = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
      expect(plyr.current_player(brd, plyr)).to eql('X')
    end
    it 'will gives the next player Token' do
      brd = ['X', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
      expect(plyr.current_player(brd, plyr)).to eql('O')
    end
  end

  describe '#turn_count' do
  it 'will gives No of Tokens are in board' do
    brd = ['X', 'X', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    expect(plyr.turn_count(brd)).to eql(2)
  end
  it 'will gives Number of Tokens are in board' do
    brd = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    expect(plyr.turn_count(brd)).to eql(0)
  end
end
end
