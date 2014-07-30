class ScoreCalculator

  attr_reader :dice

  def initialize(dice)
    @dice = dice
  end

  def triple_value
    v = 0    
    for i in 1..6
      v = i if dice.count{|die| die.value == i} > 3
    end
    return v
  end

  def triple_dice
    (dice.select{|die| die.value == triple_value}).first(3)
  end

  def scoring_dice
    dice.select{|die| triple_dice.include?(die) || [1,5].include?(die.value)}
  end

  def non_triple_scoring_dice
    scoring_dice - triple_dice
  end

  def non_scoring_dice
    dice - scoring_dice
  end

  def score_from_triple_dice
    triple_value == 1 ? 1000 : (100*triple_value)
  end

  def score_from_non_triple_scoring_dice
    x = 0
    for die in non_triple_scoring_dice
      x+= 100 if die.value == 1
      x+= 50 if die.value == 5
    end
    x
  end

  def score
    score_from_triple_dice + score_from_non_triple_scoring_dice
  end

end