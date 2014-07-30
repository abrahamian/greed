class Player

  attr_reader :name, :dice
  attr_accessor :score

  def initialize(args={})
    @name = args.fetch(:name, defaults[:name])
    @dice = defaults[:dice]
    @score = 0
  end

  def defaults
    {
      :name => "Player",
      :dice => five_fresh_dice
    }
  end

  def five_fresh_dice
    @dice = [Die.new, Die.new, Die.new, Die.new, Die.new]
  end

  def roll(dice)
    for die in dice
      die.roll
    end
    return dice
  end 

  def to_s
    name
  end

end