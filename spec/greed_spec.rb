require 'spec_helper'
require_relative '../lib/greed'

describe Game do

  let(:greed) {Game.new}
  let(:mihran) {Player.new({:name=>"Mihran"})}
  let(:ellie) {Player.new({:name=>"Ellie"})}

  describe "::new" do

    it "does something" do
      expect(greed).to_not eq nil
    end

    it "generates two players named 'Player 1' and 'Player 2' by default, if no list of players is passed" do
      expect(greed.players.map{|player| player.name}).to eq ["Player 1", "Player 2"]
    end

    it "instantiates with 2 players when a list of players is passed" do
      greed = Game.new({:players => [ellie,mihran]})
      expect(greed.players).to eq [ellie,mihran]
    end

    it "instantiates with an empty array of turns" do
      expect(greed.turns).to eq []
    end
  end

  context "adding players" do 

    describe "#add_player" do

      it "adds a player to the game" do
        greed.add_player(mihran)
        expect(greed.players.map{|player| player.name}).to eq ["Player 1", "Player 2", "Mihran"]
      end

    end

    describe "#add_players" do

      it "adds a list of players to the game" do
        greed.add_players([mihran, ellie])
        expect(greed.players.map{|player| player.name}).to eq ["Player 1", "Player 2", "Mihran", "Ellie"]
      end

    end
  end


  context "turns" do 

    describe "#new_turn" do

      it "adds a new turn object to the list of turns" do
        greed.new_turn(greed.players.last)
        expect(greed.turns.last.class).to eq Turn
      end

    end

    describe "#current_turn" do

      it "returns nil if no turns have been played" do
        expect(greed.current_turn).to eq nil
      end

    end


  end

end
