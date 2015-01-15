class Grid

attr_accessor :grid

  def initialize
    @grid = Array.new(6)
    @grid.collect! {|col| col = Array.new(7,1) }
  end

  def print
    @grid.each {|x| print x}
  end


end
