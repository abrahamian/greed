module GreedStarter

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