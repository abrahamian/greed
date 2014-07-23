class Turn

  include GreedTurnTaker
  include ScoreCalculator

  attr_reader :player, :dice

  def initialize(args)
    @player = args[:player]
    @dice = args.fetch(:dice, player.dice)
  end

  def snapshot
    dice_snapshot = []
    for die in dice
      dice_snapshot.push(Die.new({:value => die.value}))
    end
    return Turn.new({:player => player, :dice => dice_snapshot})
  end

  def hand
    dice.map{|die| die.value}
  end

  def to_s
    "#{player} rolled #{hand}."
  end

end
