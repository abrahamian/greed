class Die

  attr_reader :value

  def initialize(args={})
    @value = args.fetch(:value, nil)
  end

  def roll
    @value = (1..6).to_a.sample
  end
   
end
