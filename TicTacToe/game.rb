module TicTacToe
  class Game
    attr_accessor :player1, :player2, :grid, :turns
    def initialize
      @player1 = Player.new("X")
      @player2 = Player.new("O")
      @grid = Grid.new

      @turns = 2
      play
    end


    def turn
      puts "in"
      if(@turns % 2 == 0)
        "X"
      else
        "O"
      end
    end

    def play
      @grid.board
      current = turn
      puts @turns
      puts " '#{current}' it's your turn. 1-9"
      location = gets.chomp.to_i

      if(!@grid.already_taken?(location))
        @grid.update(location, current)
      else
        puts "that spot is already taken"
        play
      end

      if(!@grid.full? && !@grid.winner?)
        @turns += 1
        play

      else
        @grid.board
        puts "#{current} wins!"
      end
    end



  end
  class Grid < Game
    attr_accessor :grid
    def initialize
      @grid = []
      count = 0
      9.times {@grid << (count += 1).to_s}
    end

    def update(location, player)
      @grid[location - 1] = player

    end


    def full?
      @grid.any? {|val| /^0-9/ =~ val}
    end

    def board
      puts "     {#{@grid[0]}}{#{@grid[1]}}{#{@grid[2]}}"
      puts "     {#{@grid[3]}}{#{@grid[4]}}{#{@grid[5]}}"
      puts "     {#{@grid[6]}}{#{@grid[7]}}{#{@grid[8]}}"
    end

    def already_taken?(location)
      if(@grid[location - 1] == "X" || @grid[location - 1] == "O" )
        true
      else
        false
      end
    end


    def winner?
      if( @grid[0] == @grid[1] && @grid[1] == @grid[2])
        true
      elsif(@grid[3] == @grid[4] && @grid[4] == @grid[5])
        true
      elsif( @grid[6] == @grid[7] && @grid[7] == @grid[8])
        true
      elsif(@grid[0] == @grid[3] && @grid[3] == @grid[6])
        true
      elsif(@grid[1] == @grid[4] && @grid[4] == @grid[7])
        true
      elsif(@grid[2] == @grid[5] && @grid[5] == @grid[8])
        true
      elsif(@grid[2] == @grid[4] && @grid[4] == @grid[6])
        true
      elsif(@grid[0] == @grid[4] && @grid[4] == @grid[8])
        true
      else
        false
      end
    end

  end

  class Player < Grid
    attr_accessor :gamepiece
      def initialize(gamepiece)
        @gamepiece = gamepiece
      end
  end

end


x = TicTacToe::Game.new()
