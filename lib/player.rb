class Player

  attr_reader :name, :dice

  def initialize(args={})
    @dice = args.fetch(:dice, five_fresh_dice)
    
    @name = args.fetch(:name, defaults[:name])
  end

  def defaults
    {
      :name => "Player"
    }
  end

  def five_fresh_dice
    fresh_dice = []
    for i in 0..4 do
      fresh_dice[i] = Die.new
    end
    fresh_dice
  end

  def roll_all_dice
    for die in dice
      die.roll
    end
    dice
  end

  def roll_die(index)
    dice[index].roll
  end

  def to_s
    name
  end

end