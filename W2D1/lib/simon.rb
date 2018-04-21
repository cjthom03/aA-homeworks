require 'colorize'
require 'byebug'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq


  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts "A new game of Simon will start in 3 seconds."
    sleep(3)
    system('clear')
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.length.times do |i|
      system('clear')
      sleep(0.35)
      print "\n\n\n"
      print "#{@seq[i].colorize(@seq[i].to_sym)}"
      sleep(1)
    end

  end

  def require_sequence
    system('clear')
    puts "Enter the sequence one color at a time:"
    puts "Colors = red, blue, green, yellow"
    print "> "

    i = 0
    while i < @seq.length
      guess = gets.chomp
      if guess != @seq[i]
        @game_over = true
        break
      end
      i += 1
    end

  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    system('clear')
    puts "Good Job completing the round \##{@sequence_length}!"
    puts "Ready for the next one?"
    sleep(2)
    3.downto(0) do |i|
      puts "In #{i}..."
      sleep(1)
    end
  end

  def game_over_message
    puts "MMMMMEEEEEEEHHHHHHH"
    print "\n\n\n"
    puts "YOU LOSE!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    play
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
