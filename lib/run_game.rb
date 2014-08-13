require 'pry'
require_relative 'die'
require_relative 'player'
require_relative 'score_calculator'
require_relative 'turn'
require_relative 'turn_of_greed'
require_relative 'game'
require_relative 'game_of_greed'

## RUN GAME WITH STANDARD TWO PLAYERS
greed = GameOfGreed.new

# # UNCOMMENT THIS SECTION TO RUN GAME WITH THREE PLAYERS
# mihran = Player.new({:name=>"mihran"})
# ellie = Player.new({:name=>"ellie"})
# seb = Player.new({:name=>"seb"})
# greed = GameOfGreed.new({:players=>[mihran,ellie,seb]})

greed.play_greed

binding.pry