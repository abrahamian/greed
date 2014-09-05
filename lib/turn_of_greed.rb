class TurnOfGreed < Turn
  attr_reader :successful_rolls, :ui, :dice

  def post_initialize(args)
    @ui = args[:ui]
    @successful_rolls = []
    @dice = player.dice = five_fresh_dice
    spacer
  end

  def play
    if roll_all
      hot_dice_loop
      remaining_dice_loop
    end
    player_can_score_points? ? end_turn_with_cumulative_score : end_turn_with_no_added_points
  end

  private

  def hot_dice_loop
    while hot_dice? and player_wants_to_continue?
      roll_all or break
    end
  end

  def remaining_dice_loop
    while non_scoring_dice_left? and player_wants_to_continue?
      roll_remaining or break
    end
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
      ui.prompt_player(player, roll_calc)
      true
    else
      end_turn_with_nothing(just_rolled_dice)
      false
    end
  end

  def five_fresh_dice
    [Die.new, Die.new, Die.new, Die.new, Die.new]
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

  def player_can_score_points?
    cumulative_score > 0 && (player.score + cumulative_score) >= 300
  end

  def player_wants_to_continue?
    ui.player_wants_to_continue?(player)
  end

  def end_turn_with_nothing(ary)
    successful_rolls.clear
    ui.end_turn_with_nothing(player, ary)
  end
  
  def end_turn_with_cumulative_score
    player.score += cumulative_score
    ui.end_turn_with_cumulative_score(player, cumulative_score)
  end

  def end_turn_with_no_added_points
    ui.end_turn_with_no_added_points(player)
  end

  def prompt_player(calc)
    ui.prompt_player(player, calc)
  end

  def spacer
    ui.spacer
  end
end