class GreedUI

  def spacer
    puts "#################################"
  end

  def congratulate_winner(winner)
    puts "Congratulations, #{winner}, with #{winner.score} points, you have won this game of Greed!"
  end

  def final_round
    puts "FINAL ROUND! FINAL ROUND! FINAL ROUND! FINAL ROUND! FINAL ROUND! FINAL ROUND!"  
  end

  def end_turn_with_no_added_points(player)
    puts "You have accumulated zero points in this turn. Your score remains #{player.score}"
  end

  def end_turn_with_cumulative_score(player, cumulative_score)
    puts " #{player}, You have accumulated #{cumulative_score} points in this turn. Your score is now #{player.score}"
  end

  def prompt_player(player, calc)
    puts "#{player}, you just rolled #{calc.dice.map{|die| die.value }}."
    puts "the roll is worth #{calc.score}"
    puts "scoring dice are #{calc.scoring_dice.map{|die|die.value}}"
    puts "non-scoring dice are #{calc.non_scoring_dice.map{|die|die.value}}"
  end

  def player_wants_to_continue?(player)
    puts "#{player}, do you want to roll again?"
    response = gets.chomp.downcase
    return response == "y"
  end

  def end_turn_with_nothing(player, ary)
    puts " #{player}, your last roll was #{ary.map{|die| die.value}}, worth zero points. you lose all points and skip this turn."
  end

end