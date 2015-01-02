class Grid

attr_accessor :grid

  # initialize a n x n grid. default set to 3x3
  def initialize(width, height)
    if(height == width)
      @grid = Array.new(width, '\' \'')
      @grid.map! {Array.new(height, '\' \'') }
    else
      return "Please enter a square grid"
    end
  end

  # update board with players move
  def update_grid(x,y, game_piece)
    puts x.class
    puts y.class
    puts game_piece.class
    @grid[x][y] = game_piece
  end

  def print_board
    @grid.each {|row| p row}
  end

  #takes in players gamepiece to check for a winner
  def check_for_winner(piece1, piece2)
      a = @grid.transpose
      count1 = 0
      count2 = 0
      #check up and down
      for x in 0..2 do
        if(a[x] == piece1)
          count1 += 1
        elsif(a[x] == piece2)
          count2 += 1
        end
        if(count1 > 2)
          return piece1
        elsif(count2 > 2)
          return piece2
        end
        count1 = 0
        count2 = 0
      end
      #check horizontal
      a.each do |row|
        row.each do |ele|
          if(ele == piece1)
            count1 += 1
          elsif(ele == piece2)
            count2 += 1
          end
        end
        if(count1 > 2)
          return count1
        elsif(count2 > 2)
          return count2
        end

      end
  end
end


class Player
  attr_accessor :gamepiece

  def initialize(game_piece)
    @gamepiece = game_piece
  end

end

puts "Player 1 what will be your Game Piece?"
# y = STDIN.gets.chomp
player1 = Player.new(gets.chomp)
puts player1.gamepiece
puts "Player 2 what will be your Game Piece?"
# y = STDIN.gets.chomp
player2 = Player.new(gets.chomp)
puts player2.gamepiece

board = Grid.new(3,3)
board.print_board
winner = false
while(!winner)
  puts "Player one enter position ex: 0,2"
  x = gets.chomp.scan(/[0-9]/)
  x.collect! {|x| x.to_i}
  x[0].class
  board.update_grid(x[0], x[1], player1.gamepiece)
  board.print_board
  puts "Player two enter postition ex: 0,2"
  x = gets.chomp.scan(/[0-9]/)
  x.collect! {|x| x.to_i}
  board.update_grid(x[0], x[1], player2.gamepiece)
  board.print_board
  x = board.check_for_winner(player1.gamepiece, player2.gamepiece)
  if (x == player1.gamepiece || x == player2.gamepiece)
    puts "Winner"
    winner = true
  end
end
