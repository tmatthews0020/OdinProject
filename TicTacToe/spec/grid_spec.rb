require 'spec_helper'


describe TicTacToe::Grid do

  before :all do
    @grid = TicTacToe::Grid.new
  end

  it "initializes board" do
    expect(@grid).to be_instance_of(TicTacToe::Grid)
  end

end
