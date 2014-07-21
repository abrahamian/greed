class Player

  attr_reader :name, :dice

  def initialize(args={})
    @dice = []
    create_five_dice
    @name = args.fetch(:name, defaults[:name])
  end

  def defaults
    {
      :name => "Player"
    }
  end

  def create_five_dice
    for i in 0..4 do
      dice[i] = Die.new
    end
  end

  def roll_all_dice
    dice.each do |die|
      die.roll
    end
  end

  def roll_dice(index)
    dice[index].roll
  end

end