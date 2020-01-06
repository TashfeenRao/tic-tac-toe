# frozen_string_literal: true

require_relative './lib/board'
require_relative './lib/game_status'
require_relative './lib/player'

RSpec.describe 'Player' do
  let(:board) { Board.new }
  let(:plyr) { Player.new }
  let(:game) { GameStatus.new }
  let(:display) { TicTacToe.new }
  let(:win) { [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] }
end
