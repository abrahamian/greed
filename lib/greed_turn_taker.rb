module GreedTurnTaker

  def turn_of_greed

    puts "#################################"

    if roll_all

      while hot_dice?
        while player_wants_to_continue? 
          roll_all || break
          if !hot_dice?
            break
          end
        end
      end

      while non_scoring_dice_left?
        while player_wants_to_continue?
          roll_remaining || break
          if !non_scoring_dice_left? 
            break
          end
        end
        break
      end

    end

    if cumulative_score > 0 && (player.score + cumulative_score) >= 300
      player.score += cumulative_score
      puts " #{player}, You have accumulated #{cumulative_score} points in this turn. Your score is now #{player.score}"
    else
      puts "You have accumulated zero points in this turn. Your score remains #{player.score}"
    end

    puts "#################################"

  end

  def roll_all
    player.roll(dice)
    if current_score > 0
      successful_rolls.push(current_score)
      prompt_player(current_calc)
      true
    else
      end_turn_with_nothing(dice)
      false
    end
  end

  def roll_remaining
    just_rolled_dice = player.roll(current_calc.non_scoring_dice)
    roll_calc = ScoreCalculator.new(just_rolled_dice)
    if roll_calc.score > 0 
      successful_rolls << roll_calc.score
      prompt_player(roll_calc)
      true
    else
      end_turn_with_nothing(just_rolled_dice)
      false
    end
  end

  def end_turn_with_nothing(ary)
      puts " #{player}, your last roll was #{ary.map{|die| die.value}}, worth zero points. you lose all points and skip this turn."
      successful_rolls.clear
  end

  def prompt_player(calc)
    puts "#{player}, you just rolled #{calc.dice.map{|die| die.value }}."
    puts "the roll is worth #{calc.score}"
    puts "scoring dice are #{calc.scoring_dice.map{|die|die.value}}"
    puts "non-scoring dice are #{calc.non_scoring_dice.map{|die|die.value}}"
  end

  def player_wants_to_continue?
    puts "#{player}, do you want to roll again?"
    response = gets.chomp.downcase
    return response == "y"
  end

  def cumulative_score
    successful_rolls.inject(:+) || 0
  end

  def current_calc
    ScoreCalculator.new(dice)
  end

  def hot_dice?
    current_calc.scoring_dice.length == 5
  end

  def non_scoring_dice_left?
    current_calc.non_scoring_dice.any?
  end

  def current_score
    current_calc.score
  end

end