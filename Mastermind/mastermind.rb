####
# => two players decide how many games(must be even #)
# => t
#
#
#
module Mastermind
  class Game
    attr_accessor :grid, :code, :turns, :colors
      def initialize
        @turns = 0
        @grid = Board.new
        @grid.board
        comp = Player.new
        @colors = @grid.colors
        @code = comp.code
        play
      end
    # 12 possible turns
    # computer generated 4 peg color code
      def play
        winner = false
        while(!winner)
          puts @code
          puts "please input a row of four colors"
          puts "your options are B: for black, b: for blue"
          puts "g: green, y: yellow, r: red , w: white"
          @grid.board
          input = []
          (4).times { input << gets.chomp}
          puts "@colors: #{@colors}"
          #make sure input is a game color
          if((input - @colors).empty?)
            @grid.input(input, @turns)
          else
            "Please enter an option from the menu below"
            play
          end
          @turns += 1
        end
      end
  end

  class Board
    attr_accessor :grid, :code, :colors

      def initialize
        player = Player.new
        @code = player.code
        @grid = []
        @colors = []
        (12).times { @grid << [' ', ' ', ' ', ' ', '|',  ' ', ' ', ' ', ' ']}
      end

      def board
        @grid.each do |row|
          puts "{#{row}} "
          end
      end

      def colors
        @colors = ["r", "b", "g", "y", "B", "w"]
      end


      def input(a, turn)
        check_code(a)
        count = 0
        (0..3).each { |x| @grid[turn][x] = a.shift }
      end

      def check_code(a)
        counter = 0
        matches = []
        while(counter <= 3) #######################not working correctly###########################################
          convert_to_color = @code[counter]
          if(a[counter] == @colors[convert_to_color])
            matches << "b"
          elsif(@code.include?(a[counter]))
            matches << "w"   #####################################################################################
          end
          counter += 1
        end
        puts matches
      end


  end

  class Player
    attr_accessor :code

    def initialize
      @code = []
    end

    def code
      @code = (0..3).collect { rand(5) }
    end

  end
end


game = Mastermind::Game.new
