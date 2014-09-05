class Game

  attr_reader :players, :turns, :ui

  def initialize(args={})
    @players = args.fetch(:players, defaults[:players])
    @ui = args[:ui]
    @turns = []
    post_initialize(args)
  end

  def new_turn(player)
    turns << Turn.new({player: player})
    turns.last
  end

  def current_player
    current_turn.player
  end

  private

  def defaults
    {
      :players => [Player.new({:name=>"Player 1"}), Player.new({:name=>"Player 2"})]
    }
  end

  def current_turn
    turns.last
  end

  def post_initialize(args)
    nil
  end

end