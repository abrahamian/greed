class Player

  attr_reader :name, :dice
  attr_accessor :score

  def initialize(args={})
    @name = args.fetch(:name, defaults[:name])
    @dice = []
    @score = 0
  end

  def defaults
    {
      :name => "Player",
    }
  end

  def roll(die)
    die.roll
  end 

  def to_s
    name
  end

end