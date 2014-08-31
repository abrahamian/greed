class Game

  attr_reader :players, :turns

  def initialize(args={})
    @players = args.fetch(:players, defaults[:players])
    @turns = []
    post_initialize(args)
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

  def new_turn(player)
    turn = Turn.new({:player => player})
    turns << turn
  end
  
  def current_player
    current_turn.player
  end

  def next_player
    if current_player == players.last
      players.first
    else
      players[players.index(current_player) + 1]
    end
  end

  def next_turn
    new_turn(next_player)
  end

  def start_game
    new_turn(players.first) if turns.empty?
  end

  def current_turn
    turns.last
  end

end
