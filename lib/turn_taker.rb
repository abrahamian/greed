module GreedTurnTaker

  def roll_dice
    for die in dice_to_roll
      player.roll_die(die)
    end
  end

  def dice_to_roll
    all_nil? ? dice : player_chosen_dice
  end

  def player_chosen_dice
    simple_array = ask_player_to_choose_dice
    a = []
    for value in simple_array
      a << dice[dice.index{|die| die.value == value}]
    end
    a
  end

  def ask_player_to_choose_dice
    puts "#{player}, your hand is #{dice.map{|die| die.value}}"
    puts "This hand is worth #{calculate_score}"
    puts "Which dice would you like to roll?"
    answer = gets.chomp
    return answer.split(",").map { |s| s.to_i }
  end

  def all_nil?
    dice.all?{|die| die.value.nil?}
  end

end