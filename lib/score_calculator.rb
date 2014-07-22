require 'pry'

class ScoreCalculator

  attr_reader :dice

  def initialize(dice)
    @dice = dice
  end

  def triple
    triple = nil
    for die in dice do
      triple = die.value if dice.count{|x| x.value == die.value} >= 3
    end
    triple
  end

  def added_points_from_triple
    added_points = 0
    if triple
      added_points += triple * 100 unless triple == 1
      added_points += 1000 if triple == 1
    end
    added_points
  end

  def remaining_dice
    numbers = dice.dup
    if triple
      3.times do 
        numbers.delete_at(numbers.index{|die| die.value == triple})
      end
    end
    numbers
  end

  def added_points_from_remaining_numbers
    added_points = 0
    for die in remaining_dice do
      added_points += 0 unless die.value != 1 or die.value != 5
      added_points += 100 if die.value == 1
      added_points += 50 if die.value == 5
    end
    added_points
  end

  def calculate_score
    score = 0
    score += added_points_from_triple if triple
    score += added_points_from_remaining_numbers
  end

end