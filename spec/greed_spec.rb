require 'spec_helper'
require_relative '../lib/greed'


describe Player do
  let(:mihran) {Player.new({:name=>"Mihran"})}

  describe '::new' do
    
    it "creates a new player" do
      expect(mihran.class).to eq Player
    end

    it "has a name" do
      expect(mihran.name).to eq "Mihran"
    end

  end

end