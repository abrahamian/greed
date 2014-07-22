class Turn

  attr_reader :player, :hand

  def initialize(args)
    @player = args[:player]
    @hand = handify(player.dice)
  end

  def handify(dice)
    dice.map{|die| die.value}
  end

  def to_s
    "#{player} rolled #{hand}."
  end

end