
class Player

  attr_accessor :game_piece

  def initialize(args)
    @game_piece = args[:game_piece]
  end

  def player_message
    puts "Player #{self.game_piece} it's your turn!"
  end

end


class Grid < Player

attr_accessor :grid

  def initialize
    @grid = Array.new(6)
    @grid.collect! {|col| col = Array.new(7,' ') }
  end

  def print_board
    @grid.each do |row|
      puts "#{row}"
    end
    7.times {|x| print "[ #{x} ]" }
    puts "\n"
  end


    def input_into_board(player)
      puts "Where would you like to insert your next move?"
      input = STDIN.gets.chomp.to_i
      index = check_spot(input)
      if(@grid[index][input] == " ")
        @grid[index][input] = player
      else
        puts "that spot is already taken"
        input_into_board(player)
      end
    end

    def check_row
      @grid.each do |row|
        row.each_cons(4) do |sub|
          temp = sub.uniq
          if(temp.length == 1 && temp[0] != " ")
            puts "The winner is #{temp[0]}"
            return true
          end
        end
      end
      false
    end

    def check_col
      tem = @grid.transpose
      tem.each do |row|
        row.each_cons(4) do |sub|
          temp = sub.uniq
          if(temp.length == 1 && temp[0] != " ")
            puts "The winner is #{temp[0]}"
            return true
          end
        end
      end
      false
    end

    # def check_diag
    #   from_left
    #   from_right
    # end
    #
    # def from_left
    #   x , y = 0 , 0
    #   winner
    #   while(!winner)
    #     temp << @grid[x][y]
    #     x, y += 1
    #     if(temp.uniq.length == 1)
    #       winner = true
    #     end
    #
    #   end
    private

    def check_spot(i)
      pos = 0
      @grid.each_with_index do |x , index|
        if x[i] == " "
          pos = index
        end
      end
      pos
    end

  end




class Game
  attr_accessor :board, :player1, :player2, :turn

  def initialize(args)
    @board = args[:board]
    @player1 = args[:player1]
    @player2 = args[:player2]
    @turn = 0
  end

  def no_winner?
    return false unless @turns > 47
  end

  def turn
    if(@turn % 2 == 0)
      return @player1
    else
      return @player2
    end
  end

  def play
    player = turn
    player.player_message
    @board.print_board
    @board.input_into_board(player.game_piece)
    if(winner?)
      @board.print_board
      return
    else
      @turn += 1
      play
    end
  end

  def winner?
    if(@board.check_row)
      true
     elsif(@board.check_col)
       true
    # elsif(@board.check_diag)
    #   true
    else
      false
    end
  end


end


args = {
  board: Grid.new,
  player1: Player.new({game_piece:'+'}),
  player2: Player.new({game_piece:'='})
}
game = Game.new(args)
game.play
