require 'spec_helper'
require_relative '../lib/die'
require_relative '../lib/score_calculator'

describe ScoreCalculator do

  def dice_faker(array)
    array.map{|value| Die.new({:value=> value})}
  end

  describe '#non_scoring_dice' do
    it "returns the dice that scored no points" do
      score_calc = ScoreCalculator.new(dice_faker([1,2,3,4,5]))
      expect(score_calc.non_scoring_dice.map{|die| die.value}).to eq [2,3,4]
    end
  end

  describe '#scoring_dice' do
    it "returns the dice scored points" do
      score_calc = ScoreCalculator.new(dice_faker([3,3,6,1,3]))
      expect(score_calc.scoring_dice.map{|die| die.value}).to eq [3,3,1,3]
    end
  end

  describe "#score" do 

    it "calculates a score of 50 for a single roll of 5" do 
      single_roll_of_5 = ScoreCalculator.new(dice_faker([5]))
      expect(single_roll_of_5.score).to eq 50
    end

    it "calculates a score of 0 for an empty list" do
      empty_hand = ScoreCalculator.new([])
      expect(empty_hand.score).to eq 0
    end

    it "calculates a score of 0 for a hand composed of single 2s, 3s and 4s" do 
      only_single_twos_threes_fours_and_sixes = ScoreCalculator.new(dice_faker([2,3,4,6]))
      expect(only_single_twos_threes_fours_and_sixes.score).to eq 0
    end

    it "calculates a score of 1000 for triple 1" do 
      triple_one = ScoreCalculator.new(dice_faker([1,1,1]))
      expect(triple_one.score).to eq 1000
    end

    it "calculates a score of 100x the value for other triples" do
      triple_five = ScoreCalculator.new(dice_faker([5,5,5]))
      expect(triple_five.score).to eq 500
    end

    it "calculates an accurate score for a mixed roll" do
      mixed_roll = ScoreCalculator.new(dice_faker([2,5,2,2,3]))
      expect(mixed_roll.score).to eq 250
    end

  end

end