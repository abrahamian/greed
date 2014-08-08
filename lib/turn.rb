class Turn

  attr_reader :player, :dice

  def initialize(args)
    @player = args[:player]
    @dice = player.dice
  end

  def hand
    dice.map{|die| die.value}
  end

  def to_s
    "#{player} rolled #{hand}."
  end

end

