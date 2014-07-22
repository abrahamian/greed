class Turn

  attr_reader :player, :hand, :dice

  def initialize(args)
    @player = args[:player]
    @dice = snapshot_of_dice(player.dice)
  end

  def snapshot_of_dice(array)
    snapshot = []
    for die in array
      snapshot.push(Die.new({:value => die.value}))
    end
    snapshot
  end

  def hand
    dice.map{|die| die.value}
  end

  def to_s
    "#{player} rolled #{hand}."
  end

end