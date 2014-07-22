require 'spec_helper'
require_relative '../lib/player'

describe Player do

  let(:mihran) {Player.new({:name=>"Mihran"})}

  describe '::new' do
    
    it "does something" do 
      expect(mihran).to_not eq nil
    end

    it "creates a new player" do
      expect(mihran.class).to eq Player
    end

  end

  describe "#name" do
    
    it "has a name" do
      expect(mihran.name).to eq "Mihran"
    end

    it "takes the default name 'Player' if no name is passed" do
      expect(Player.new.name).to eq "Player"
    end

  end

  describe "#dice" do

    it "holds dice" do
      expect(mihran.dice).to_not eq nil
    end

    it "its dice are all instances of Die" do
      expect(mihran.dice.any?{|d| d.class !=Die}).to eq false
    end

    it "has five dice" do
      expect(mihran.dice.length).to eq 5
    end

  end 


  describe "to_s" do

    it "returns the player's name" do
      expect("#{mihran}").to eq "Mihran"
    end

  end

end
