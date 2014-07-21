require 'pry'
require 'player'
require 'die'
require 'turn'
require 'score_calculator'

class Game

  attr_reader :players, :turns

  def initialize(args={})
    @players = args.fetch(:players, default_players)
    @turns = []
  end

  def default_players
    [Player.new({:name=>"Player 1"}), Player.new({:name=>"Player 2"})]
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
    turns << Turn.new({:player => player})
  end

  def current_turn
    turns.last
  end

end