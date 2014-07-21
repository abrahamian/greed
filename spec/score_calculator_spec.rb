require 'spec_helper'
require_relative '../lib/score_calculator'

describe ScoreCalculator do

  def dice_faker(array)
    array.map{|value| Die.new({:value=> value})}
  end

  describe "::new" do

    it "does something" do
      expect(ScoreCalculator.new([])).to_not eq nil
    end

  end

  describe "#calculate_score" do 

    it "calculates a score of 50 for a single roll of 5" do 
      single_roll_of_5 = ScoreCalculator.new(dice_faker([5]))
      expect(single_roll_of_5.calculate_score).to eq 50
    end

    it "calculates a score of 0 for an empty list" do
      empty_list = ScoreCalculator.new([])
      expect(empty_list.calculate_score).to eq 0
    end

    it "calculates a score of 0 for a hand composed of single 2s, 3s and 4s" do 
      only_single_twos_threes_fours_and_sixes = ScoreCalculator.new(dice_faker([2,3,4,6]))
      expect(only_single_twos_threes_fours_and_sixes.calculate_score).to eq 0
    end

    it "calculates a score of 1000 for triple 1" do 
      triple_one = ScoreCalculator.new(dice_faker([1,1,1]))
      expect(triple_one.calculate_score).to eq 1000
    end

    it "calculates a score of 100x the value for other triples" do
      triple_five = ScoreCalculator.new(dice_faker([5,5,5]))
      expect(triple_five.calculate_score).to eq 500
    end

    it "calculates an accurate score for a mixed roll" do
      mixed_roll = ScoreCalculator.new(dice_faker([2,5,2,2,3]))
      expect(mixed_roll.calculate_score).to eq 250
    end

  end

end