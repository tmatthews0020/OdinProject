class String
 def validate regex
   !self[regex].nil?
 end
end



class Dictionary
  attr_accessor :dictionary, :word, :word_length

  def initialize
    @dictionary = []
    read_dictionary_file
    random_word
    word_length

  end

  def read_dictionary_file
    lines = File.readlines "5desk.txt"
    lines.each do |line|
      @dictionary << line
    end
  end

  def word_length
    @word_length = @word.length - 2 #  - 2 is to compensate for /r & /n in string
  end

  def random_word
    length = 0
    while(length < 5)
      random = rand(@dictionary.length)
      @word = @dictionary[random].downcase
      length = word_length

    end
    @word
  end
end



class Hangman < Dictionary

attr_accessor :game, :guesses, :turns, :letters, :game_array

  def initialize
    @game = Dictionary.new
    @turns = 10
    @guesses = []
    start_game
  end

  def start_game
    word_output
    while(!full?)
      board
      puts "Please input a letter as a Guess!"
      input = get_input
      if(wins?)
        puts "You win!"
      end

    end

  end

  def board
    print @game_array
    puts ""
  end

  def get_input
    puts @letters
    x = gets.chomp.downcase
    regexp = /[a-z]/
      while(!x.validate(regexp))
        puts "Reenter a Letter a-z or A-Z"
        x = gets.chomp.downcase
      end
    if(x == 'guess')
      if(guess?)
        puts "that is correct!"
        @turns = 0
      else
        puts "sorry that is not correct"
      end
    else
      check_letters_array(x)
      guesses
    end
  end


  def guess?
    correct = true
    puts "what is your guess?"
    guess = gets.chomp
    guess = guess.split("")

    @letters.each_with_index do |char, index|
      if(char != guess[index])
        false
      end
    end
    if(correct)
      @letters.each_with_index do |char, index|
        @game_array = char
        end
      end

  end

  def check_letters_array(letter)

    positions = Array.new
    @letters.each_with_index do | value, index |
      # puts "#{value} & #{index}"
      if(value == letter)
        @game_array[index] = letter
      end
    end
  end
#set up both arrays one for display to player and the other with the word as an array of characters to
#determine where a letter is in a word.
  def word_output
    @game_array = []
    @letters = []
    (@game.word_length).times { @game_array << "_"}
    @letters = @game.word.tr("/\n\r/", "").split("")
    # @game.word.each_char { |x| @letters << x }
  end

  def full?
    if(@turns <= 0)
       true
     else
       false
    end

  end

  def wins?
    winner = true
    @letters.each_with_index do |value, index|
      # puts "checking"
      # puts "#{value} & #{@game_array[index]}"
      winner = false unless value == @game_array[index]
    end
    winner
  end

  def guesses
    @turns -=1
    puts "You have #{@turns} left!"
  end

end


game = Hangman.new
