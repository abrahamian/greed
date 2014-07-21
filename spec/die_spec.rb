require 'spec_helper'
require_relative '../lib/die'

describe Die do

  let(:die) { Die.new}

  describe "::new" do

    it "instantiates a die" do
      expect(die).to_not eq nil
    end

    it "has nil value when instantiated without arguments passed" do
      expect(die.value).to eq nil
    end

    it "can be instantiated with a value by passing an object as argument" do
      die_with_args = Die.new({:value=>6})
      expect(die_with_args.value).to eq 6
    end

  end

  describe "#roll" do

    it "does something" do
      expect(die.roll).to_not eq nil
    end

    it "rolls and gives the die a non-nil value" do
      die.roll
      expect(die.value).to_not eq nil
    end

    it "rolls and gives the die a value between 1 and 6" do
      die.roll
      expect(1..6).to include die.value
    end

  end

end
