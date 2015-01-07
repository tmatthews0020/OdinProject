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
        comp = Player.new
        @code = comp.code
        @colors = comp.colors
        play
      end
    # 12 possible turns
    # computer generated 4 peg color code
      def play
        winner = false
        while(!winner)
          puts "please input a row of four colors"
          puts "your options are B: for black, b: for blue"
          puts "g: green, y: yellow, r: red , w: white"
          @grid.board
          input = []
          (4).times { input << gets.chomp}
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


      def input(a, turn)
        matches = check_code(a)
        count = 0
        (0..3).each { |x| @grid[turn][x] = a.shift }
        (5..8).each { |x| @grid[turn][x] = matches.shift unless nil}
      end

      def check_code(a)
        temp = []
        temp = @code
      puts " code is #{temp}"
        counter = 0
        matches = []
        while(counter <= 3)
          if(a[counter] == temp[counter])
            matches << "b"
            temp[counter] = "0"
          elsif(temp.include?(a[counter]))
            matches << "w"
            temp[counter] = "0"
          end
        puts " code is #{temp}"
          counter += 1
        end
        matches
      end


  end

  class Player
    attr_accessor :player_code, :colors

    def initialize
      color_list
      @player_code = code
    end

    def code
      @code = (0..3).collect { rand(5) }
      @code.collect! {|x| @colors[x]}
    end

    def color_list
      @colors = ["r", "b", "g", "y", "B", "w"]
    end

  end
end


game = Mastermind::Game.new
