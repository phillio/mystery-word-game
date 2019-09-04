class Word
  # Stores the provided word in an instance variable and
  # setups up any other instance variables.
  attr_accessor :word, :guessed_word, :lives
  def initialize(word)
    @word = word
    @guessed_word = ["_"] * @word.length
    @lives = 3
  end

  # Guess a letter in the word.
  # Should return a boolean. true if the letter is in the word, false if not.
  def guess?(letter)
    @word.downcase.include?(letter)
  end

  # Whether all letters in the word have been guessed correctly.
  def guessed_all_correct?
    @word == guessed_word.join('')
  end

  # Display the current state of the guessed word for the player.
  def output_word
    puts ""
    puts @guessed_word.join(" ")
    puts "#{@lives} lives left"
    puts ""
  end

  # Check whether a provided character is a letter
  def self.is_letter?(character)
    #skipping for now
  end
end

class MysteryWordGame
  # Initialize any state in the game, and start the game loop.
  def initialize
    @game = ''
    game_loop
  end

  def ask_for_word
    puts "User 1 type in a word, User 2 look away"
    puts ""
    user_word = gets.chomp
    @game = Word.new(user_word)
  end

  # Run the game loop, which continues until the player wins or loses.
  def game_loop
    ask_for_word
    while (!@game.guessed_all_correct?)
      puts "Guess a letter"
      user_guess = gets.chomp
    if (!@game.guess?(user_guess))
      puts "WRONG"
      @game.lives -=1
      @game.output_word
      return puts "you lost" if @game.lives == 0
    elsif (@game.guess?(user_guess))
        puts "Correct"
        @split_word = @game.word.split('')
       @split_word.each_with_index do |val, index|
          @game.guessed_word[index] = user_guess if val == user_guess
        end
        @game.output_word
        puts "you win" if @game.guessed_all_correct?
      end
    end
  end
end

MysteryWordGame.new
