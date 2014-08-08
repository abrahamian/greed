require 'pry'
require_relative 'die'
require_relative 'player'
require_relative 'score_calculator'
require_relative 'turn'
require_relative 'TurnOfGreed'
require_relative 'game'
require_relative 'GameOfGreed'





greed = GameOfGreed.new
greed.play_greed

binding.pry