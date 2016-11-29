require_relative "tile.rb"

class Board
  FILE_TO_READ = "sudoku2.txt"

  def initialize(grid = nil)
    @grid = grid
  end

  def self.from_file
    file_arr = File.readlines(FILE_TO_READ).map(&:chomp)
    temp_array = [[]]

    file_arr.each do |row|
      row.each_char do |char|
        temp_array.last << Tile.new(char.to_i)
      end
      temp_array << []
    end

    final_arr = temp_array.reject! { |el| el.empty? }

    Board.new(final_arr)
  end

  def render
    result = ""
    @grid.each do |row|
      row.each do |tile|
        result << tile.to_s
        result << "|"
      end
      result << "\n"
    end
    puts result
    puts "\n\n"
  end

  def solved?
    rows_solved? && cols_solved? && squares_solved?
  end

  def rows_solved?
    @grid.all? {|row| row.inject(&:+) == 45}
  end

  def cols_solved?
    @grid.cols.all? {|col.value| col.inject(&:+) == 45}
  end

  def

  def cols
    result = []
    (0...9).each do |idx|
      temp_array = []
      @grid.each do |row|
        temp_array << row[idx]
      end
      result << temp_array
      temp_array = []
    end
    result.map! {|}
  end

  def squares_solved?
  end


end

 x = Board.from_file
p x.render
