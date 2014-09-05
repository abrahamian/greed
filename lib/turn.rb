class Turn

  attr_reader :player

  def initialize(args)
    @player = args[:player]
    post_initialize(args)
  end

  def post_initialize(args)
    nil
  end

end