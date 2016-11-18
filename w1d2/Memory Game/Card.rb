
class Card

  attr_accessor :value, :visible

  def initialize(value = nil)
    @value = value
    @visible = false
  end

  def hide
    @visible = false
  end


  def reveal
    @visible = true
  end

  def to_s
    if self.visible
      self.value.to_s
    else
      "X"
    end
  end

  # def ==(other_card)
  #   self == other_card
  # end

end
