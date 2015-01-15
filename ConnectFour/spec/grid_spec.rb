require 'spec_helper'

describe Grid do

  before :each do
    @board = Grid.new
    @grid = @board.grid

  end

  it "is initialized" do
    expect(@board).to be_instance_of Grid
  end

  it "should be 6 x 7" do
    expect(@grid.length).to eql(6)
    @grid.each do |x|
      expect(x.length).to eql(7)
    end
  end
end
