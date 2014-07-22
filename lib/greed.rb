require_relative 'die'
require_relative 'player'
require_relative 'turn'
require_relative 'score_calculator'

class Game

  attr_reader :players
  attr_accessor :turns

  def initialize(args={})
    @players = args.fetch(:players, defaults[:players])
    @turns = []
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
    ###
    player.roll_all_dice
    turns << Turn.new({:player => player})
  end

  def current_turn
    turns.last
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

end
