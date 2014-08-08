class Game

  attr_reader :players

  def initialize(args={})
    @players = args.fetch(:players, defaults[:players])
  end

  def defaults
    {
      :players => [Player.new({:name=>"Player 1"}), Player.new({:name=>"Player 2"})]
    }
  end

  def add_players(players)
    for player in players
      add_player(player)
    end
  end

  def add_player(player)
    players << player
  end

end
