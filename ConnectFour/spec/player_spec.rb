require 'spec_helper'


describe Player do

  before :each do
    args = {
      :game_piece => "%"
    }
    @player = Player.new(args)

  end

  it "should be an instace of Player" do
    expect(@player).to be_instance_of Player
  end

  it "should have a gamepiece" do
    expect(@player.game_piece).to eql('%')
  end


end
