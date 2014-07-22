class Player

  attr_reader :name, :dice

  def initialize(args={})
    @dice = args.fetch(:dice, defaults[:dice])
    @name = args.fetch(:name, defaults[:name])
  end

  def defaults
    {
      :name => "Player",
      :dice => [Die.new, Die.new, Die.new, Die.new, Die.new]
    }
  end

  def roll_die(die)
    die.roll
  end 

  def to_s
    name
  end

end