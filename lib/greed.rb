require 'pry'

class Greed

  attr_reader :players

  def initialize(args)
    @players = []
    add_players(args[:players])
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


class Player

  attr_accessor :name

  def initialize(args)
    @name = args[:name]
  end

end


# mihran = Player.new({:name => "mihran"})
# ellie = Player.new({:name => "ellie"})

# Game = Greed.new({:players => [ellie,mihran]})

