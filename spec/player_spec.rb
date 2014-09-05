require 'spec_helper'
require 'rspec/mocks'
require_relative '../lib/player'

RSpec.configure do |config|
  config.mock_framework = :rspec
end

describe Player do

  let(:mihran) {Player.new({:name=>"Mihran"})}

  # incoming query message
  describe "#to_s" do
    it "returns player's name" do
      expect("#{mihran}").to eq "Mihran"
    end
  end

  # incoming command message
  describe "#score=" do
    it "changes the player's score" do
      mihran.score += 69
      expect(mihran.score).to eq 69
    end
  end

  # outgoing command message
  it "#roll" do
    dbl = double("Some dice")
    expect(dbl).to receive(:roll)
    mihran.dice = [dbl]
    mihran.roll(mihran.dice)
  end

end