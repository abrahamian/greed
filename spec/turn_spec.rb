require 'spec_helper'
require_relative '../lib/turn'

describe Turn do

  let(:player){double("Some Player")}
  let(:turn){Turn.new({:player=>player})}


  describe "#player" do
    it "holds a player object" do
      expect(turn.player).to be player
    end
  end

end