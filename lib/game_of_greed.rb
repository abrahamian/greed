class GameOfGreed < Game

  attr_reader :winner

  def post_initialize(args)
    @ui = GreedUI.new
  end

  def play_greed
    new_turn(players.first)
    next_turn until someone_has_reached(3000)
    final_round
    for player in players
      new_turn(player)
    end
    set_winner
    congratulate_winner
  end

  def next_turn
    new_turn(next_player)
  end

  def next_player
    if current_player == players.last
      players.first
    else
      players[players.index(current_player) + 1]
    end
  end

  def new_turn(player)
    turn = TurnOfGreed.new({:player => player, :ui=> ui})
    turns << turn
    turn.play
  end

  private

  def set_winner
    @winner = players.max_by{|player| player.score}
  end

  def someone_has_reached(number)
    players.any?{|player| player.score >= number}
  end

  def final_round
    ui.final_round
  end

  def congratulate_winner
    ui.congratulate_winner(winner)
  end


end