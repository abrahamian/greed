require 'pry'

require_relative 'greed'

greed = Game.new

greed.start_game

while greed.turns.length < 10
  greed.next_turn
end

for turn in greed.turns
  puts turn
end

for player in greed.players
  puts " #{player} scored #{ScoreCalculator.new(player.dice).calculate_score}"
end


