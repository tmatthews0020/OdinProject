require_relative '../grid.rb'


describe Grid do

  it "is class Grid" do
    @board = Grid.new(3,3)
    expect(@board.class).to eq(Grid)
  end

  it "initialize grid array 2d" do
    @board = Grid.new(3,3)

    @board.grid.each do |row|
      expect(row.length).to eq(3);
    end
  end
end
