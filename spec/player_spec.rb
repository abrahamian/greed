require 'spec_helper'
require 'rspec/mocks'
require_relative '../lib/player'

describe Player do

  let(:joe) {Player.new({:name=>"Joe"})}

  # incoming query message
  describe "#to_s" do
    it "returns player's name" do
      expect("#{joe}").to eq "Joe"
    end
  end

  # incoming command message
  describe "#score=" do
    it "changes the player's score" do
      joe.score += 69
      expect(joe.score).to eq 69
    end
  end

  # outgoing command message
  describe "#roll" do
    it "sends roll message to all dice passed to it" do
      dbl1 = double("Some Dice")
      dbl2 = double("Another Dice")
      expect(dbl1).to receive(:roll)
      expect(dbl2).to receive(:roll)
      joe.dice = [dbl1, dbl2]
      joe.roll(joe.dice)
    end
  end

end