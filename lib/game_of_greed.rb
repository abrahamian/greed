class GameOfGreed < Game

  attr_reader :winner, :ui

  def post_initialize(args)
    @ui = args.fetch(:ui, GreedUI.new)
  end

  def play_greed
    new_turn(players.first)
    next_turn until someone_has_reached(3000)
    ui.final_round
    for player in players
      new_turn(player)
    end
    set_winner
    ui.congratulate_winner(winner)
  end

  def next_turn
    new_turn(next_player)
  end

  def new_turn(player)
    turn = TurnOfGreed.new({:player => player, :ui=> ui})
    turns << turn
  end

  def set_winner
    @winner = players.max_by{|player| player.score}
  end

  def someone_has_reached(number)
    players.any?{|player| player.score >= number}
  end

end