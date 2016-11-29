class Array

  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end
    result
  end

  def two_sum
    sums = []
    (self.length - 1).times do |x|
      ((x+1)...self.length).to_a.each do |y|
        sums << [x,y] if self[x] + self[y] == 0
      end
    end
    sums
  end

  def my_transpose
    long_s = 0
    self.each { |el| long_s = el.length if el.length > long_s}
    trans = Array.new(long_s){Array.new(self.length)}
    trans.length.times do |x|
      trans[0].length.times do |y|
        trans[x][y] = self[y][x]
      end
    end
    trans
  end

  def stock_picker
    best_days = []
    largest_diff = 0
    (self.length - 1).times do |x|
      ((x+1)...self.length).to_a.each do |y|
        current_diff = self[y] - self[x]
        if current_diff > largest_diff
          largest_diff = current_diff
          best_days = [x,y]
        end
      end
    end
    best_days
  end
end


class Towers_Hanoi

  attr_accessor :towers

  def initialize(towers = [[3,2,1],[],[]])
    @towers = towers
  end

  def move(start, finish)
    if @towers[start].last > @towers[finish].last
      raise "You can't do that!"
    else
      towers[finish].push(towers[start].pop)
    end
  end

  def won?
    @towers[0].empty? && (@towers[1].empty? || @towers[2].empty?)
  end


end
