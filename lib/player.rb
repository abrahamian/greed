class Player

  attr_reader :name
  attr_accessor :score, :dice

  def initialize(args={})
    @name = args.fetch(:name, defaults[:name])
    @dice = args.fetch(:dice, defaults[:dice])
    @score = 0
  end

  def roll(args)
    for die in args
      die.roll
    end
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