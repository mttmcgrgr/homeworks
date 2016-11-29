class Tile



  def initialize(value)
    @value = value
  end

  def to_s
    if @value == 0
      "_"
    else
      @value.to_s
    end
  end



end
