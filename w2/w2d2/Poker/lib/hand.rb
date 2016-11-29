require_relative 'card'

class Hand

  attr_accessor :cards, :value

  def initialize(cards)
    @cards = cards
    # @cards.sort
  end


  def value
    return 10 if royal_flush?
    return 9 if straight_flush?
    return 8 if four_kind?
    return 7 if full_house?
    return 6 if flush?
    return 5 if straight?
    return 4 if three_kind?
    return 3 if two_pair?
    return 2 if pair?
    return 1
  end

  def royal_flush?
    same_suit? && consecutive? && @cards.first.value == 14
  end

  def straight_flush?
    same_suit? && consecutive? && @cards.first.value != 14
  end

  def four_kind?
    same_val?(4)
  end

  def full_house?
    same_val?(3) && same_val?(2)
  end

  def flush?
    same_suit? && !consecutive?
  end

  def straight?
    consecutive? && !same_suit?
  end

  def three_kind?
    same_val?(3) && !same_val?(2)
  end

  def two_pair?
    card_values = get_values
    card_count= Hash.new(0)
    card_values.each do |val|
      card_count[val] += 1
    end
    card_count.values.select { |val| val == 2 }.length == 2
  end

  def pair?
    same_val?(2)
  end

  def get_values
    values = []
    @cards.each { |card| values << card.value }
    values
  end

  def get_suits
    suits = []
    @cards.each { |card| suits << card.suit }
    suits
  end

  def same_suit?
    get_suits.uniq.length == 1
  end

  def consecutive?
    card_values = get_values

    card_values == ((card_values.last)..(card_values.first)).to_a.reverse
  end

  def same_val?(num)
    card_values = get_values
    card_count= Hash.new(0)
    card_values.each do |val|
      card_count[val] += 1
    end
    card_count.values.include?(num)
  end

  def tiebreaker(hand1, hand2)
    "Awesome tie! Great job!"
  end

  def compare_hand(other_hand)
    if value > other_hand.value
      return self
    elsif value < other_hand.value
      return other_hand
    else
      tiebreaker(self, other_hand)
    end
  end

end
