require 'spec_helper'
require_relative '../lib/die'

describe Die do

  let(:die) { Die.new}

  describe "#value" do 

    it "instantiates with nil value if no args are passed" do
      expect(die.value).to eq nil
    end

    it "instantiates with a specified value if passed in args" do
      die_with_args = Die.new({:value=> 4})
      expect(die_with_args.value).to eq 4
    end

  end
  
  describe "#roll" do

    it "its values are always between 1 and 6" do
      die_values = []
      30.times do
        die.roll
        die_values << die.value
      end
      expect(die_values.none?{|value| [1,2,3,4,5,6].include?(value)}).to eq false
    end

  end
end
