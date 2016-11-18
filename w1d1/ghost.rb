class Game

  attr_reader :player1, :player2, :dictionary
  attr_accessor :fragment

  def initialize(players = {})
      @player1 = player1
      @player2 = player2
      @dictionary = File.readlines("dictionary.txt")
  end

  def play_round

  end

  def current_player
  end

  def previous_player
  end

  def next_player!
    if @current_player == player1
      @current_player = player2
      @previous_player = player1
    else
      @current_player = player1
      @previous_player = player2
    end
  end

  def take_turn(player)
    challenge?
    puts "#{player.name} give me a guess"
    guess = player.guess
    if valid_play?(guess)
      fragment + guess
    else
      take_turn(player)
    end
    challenge?



  end

  def challenge?
    puts "do you want to challenge?"
    answer = gets.chomp
    if answer == "yes"
      if dictionary.any? {|words| words.starts_with?(@fragment)}
        you_lose

      end
    end
  end

  def valid_play?(str)
    if ("a".."z").include? string.downcase
      true
    elsif !dictionary.any? do |words|
      words.starts_with?(@fragment.concat(str))
      false
    elsif

    true
    end
  end

  def losses
  end

  def record
  end

  def run
  end


end

class Player
  attr_accessor :ghost

  def initialize(name)
    @name = name
    @ghost = ""
  end

  def guess
    gets.chomp
  end

  def alert_invalid_guess
  end

end
