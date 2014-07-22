require 'spec_helper'
require_relative '../lib/turn'

describe Turn do


  let(:dice){ [Die.new({:value=>1}), Die.new({:value=>2}), Die.new({:value=>3}), Die.new({:value=>4}), Die.new({:value=>5})]}
  let(:player){Player.new({:dice=> dice})}
  let(:turn){Turn.new({:player=>player})}

  describe '::new' do
    
    it "does something" do
      expect(turn).to_not eq nil
    end

    it "creates a Turn object" do
      expect(turn.class).to eq Turn
    end

  end

  describe "dice" do

    it "is an array of die objects" do
      expect(turn.dice.any?{|element| element.class != Die}).to eq false
    end

    it "its dice are not the same as those passed to it" do
      expect(turn.dice).to_not eq player.dice
    end

    it "its dice are copies of the player's dice" do
      expect(turn.dice.map{|die| die.value}).to eq [1,2,3,4,5]
    end

  end

  describe "hand" do

    it "returns an array of the dice values" do
      expect(turn.hand).to eq [1,2,3,4,5]
    end

  end

  describe "to_s" do

    it "returns a string indicating the player name and their hand" do
      expect(turn.to_s).to eq "Player rolled [1, 2, 3, 4, 5]."
    end

  end


end