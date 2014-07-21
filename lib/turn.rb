class Turn

  attr_reader :player

  def initialize(args)
    @player = args[:player]
  end

end