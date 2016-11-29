class Card
  include Comparable

  attr_accessor :value, :suit

  def initialize(value,suit)
    @value = value
    @suit = suit
  end

  def <=>(other)
    return -1 if self.value > other.value
    return 0 if self.value == other.value
    return 1 if self.value < other.value
  end

end
