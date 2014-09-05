class Player

  attr_reader :name
  attr_accessor :score, :dice

  def initialize(args={})
    @name = args.fetch(:name, defaults[:name])
    @dice = defaults[:dice]
    @score = 0
  end

  def roll(dice)
    for die in dice
      die.roll
    end
    dice
  end 

  def to_s
    name
  end

  private

  def defaults
    {
      :name => "Player",
      :dice => []
    }
  end

end