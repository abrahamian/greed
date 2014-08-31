class TurnOfGreed < Turn

  attr_reader :successful_rolls, :ui

  def post_initialize(args)
    @ui = args[:ui]
    @successful_rolls = []
    play
  end

  def play
    
    if roll_all
      while hot_dice? and player_wants_to_continue?
        roll_all or break
      end

      while non_scoring_dice_left? and player_wants_to_continue?
        roll_remaining or break
      end
    end

    if cumulative_score > 0 && (player.score + cumulative_score) >= 300
      player.score += cumulative_score
      ui.end_turn_with_cumulative_score(player, cumulative_score)
    else
      ui.end_turn_with_no_added_points(player)
    end

  end

  def roll_all
    player.roll(dice)
    if current_score > 0
      successful_rolls.push(current_score)
      ui.prompt_player(player, current_calc)
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
      ui.prompt_player(player, roll_calc)
      true
    else
      end_turn_with_nothing(just_rolled_dice)
      false
    end
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

  def player_wants_to_continue?
    ui.player_wants_to_continue?(player)
  end

  def end_turn_with_nothing(ary)
    ui.end_turn_with_nothing(player, ary)
    successful_rolls.clear
  end
  
end