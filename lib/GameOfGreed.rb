class GameOfGreed < Game

  attr_reader :turns, :winner

  def initialize(args={})
    super(args)
    @turns = []
  end

  def play_greed
    new_turn(players.first)
    next_turn until someone_has_reached(3000)
    puts "FINAL ROUND! FINAL ROUND! FINAL ROUND! FINAL ROUND! FINAL ROUND! FINAL ROUND!"
    for player in players
      new_turn(player)
    end
    set_winner
    congratulate_winner
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

  def current_turn
    turns.last
  end

  def set_winner
    @winner = players.max_by{|player| player.score}
  end

  def congratulate_winner
    puts "Congratulations, #{winner}, with #{winner.score} points, you have won this game of Greed!"
  end

  def someone_has_reached(number)
    players.any?{|player| player.score >= number}
  end

end