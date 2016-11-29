require_relative 'card'

class Deck

  SUITS = [:hearts,:diamonds,:clubs,:spades]
  attr_accessor :stack

  def initialize
    @stack = []
    fill_stack
  end

  def fill_stack
    SUITS.each do |suit|
      (2..14).to_a.each do |num|
        @stack << Card.new(num,suit)
      end
    end
  end

  def deal(num)
    cards_dealt = []
    num.times do
      cards_dealt << @stack.pop
    end
    cards_dealt
  end

  def shuffle
    @stack.shuffle!
  end
end
