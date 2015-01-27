require 'spec_helper'


describe Game do

  before :each do
    args = {
      board: Grid.new,
      player1: Player.new({game_piece:'%'}),
      player2: Player.new({game_piece:'&'})
    }
    @game = Game.new(args)
  end

  it "should have a board" do
    expect(@game.board.grid.length).to eq(6)
  end

  it "should have two players" do
    expect(@game.player1.class).to eq(Player)
    expect(@game.player2.class).to eq(Player)
  end

  it "should be turn based" do
    expect(@game.turn).to eq(0)
    @game.turn += 1
    expect(@game.turn).to eq(1)
  end






end
