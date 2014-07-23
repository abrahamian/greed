require 'pry'
require_relative 'greed'

greed = Game.new

greed.start_game

while greed.turns.length < 10
  greed.next_turn
end

puts greed.turns

binding.pry