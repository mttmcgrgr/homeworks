require_relative "Board.rb"
require_relative "Card.rb"


class Game
  attr_reader :board, :last_guess, :current_guess

  def initialize
    @board = Board.new
    @last_guess = nil
    @current_guess = nil
  end

  def play
    until @board.won?
      make_guess
    end
  end

  def card_at(pos)
    @board.grid[pos[0]][pos[1]]
  end


  def make_guess
    @board.render
    puts "enter a guess"
    input = gets.chomp.chars.map(&:to_i)
    current_card = card_at(input)

    if @last_guess.nil?
      @last_guess = current_card
      @last_guess.reveal
      @board.render
      puts "enter another guess"
      input = gets.chomp.chars.map(&:to_i)
      @current_card = card_at(input)
    end


    @last_guess.reveal
    @current_card.reveal
    @board.render

    if @last_guess.value == card_at(input).value
      puts "Correct! Good guess!"
      @last_guess.value = "_"
      card_at(input).value = "_"
      @last_guess = nil
      sleep(2)
    else
      puts "Try again!"
      @last_guess.reveal
      @current_card.reveal
      @board.render
      sleep(2)
      system("clear")

      @last_guess.hide
      @current_card.hide
      @last_guess = nil
    end

  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
