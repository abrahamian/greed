class Turn

  attr_reader :player, :dice, :successful_rolls

  def initialize(args)
    @player = args[:player]
    @dice = player.dice
    @successful_rolls = []
    turn_of_greed
  end

  def hand
    dice.map{|die| die.value}
  end

  def to_s
    "#{player} rolled #{hand}."
  end

end

