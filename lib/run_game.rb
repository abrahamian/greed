require 'pry'
require_relative 'die'
require_relative 'player'
require_relative 'score_calculator'
require_relative 'greed_turn_taker'
require_relative 'turn'
require_relative 'greed_starter'
require_relative 'game'

class Game
  include GreedStarter
end

class Turn
  include GreedTurnTaker
end

greed = Game.new
greed.play_greed

binding.pry