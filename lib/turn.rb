class Turn

  attr_reader :player, :dice, :turns

  def initialize(args)
    @player = args[:player]
    @dice = player.dice
  end

  def hand
    dice.map{|die| die.value}
  end

  def to_s
    "#{player} rolled #{hand}."
  end

  def new_turn(player)
    turn = TurnOfGreed.new({:player => player})
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


end

