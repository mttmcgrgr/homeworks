# require "byebug"
require_relative 'Card.rb'

class Board
  attr_reader :grid

  def initialize(grid = nil)
    @grid = grid || Array.new(4) { Array.new(4, []) }

    self.populate
  end

  def render
    result = ""
    @grid.each do |line|
      line.each do |card|
        result << card.to_s
      end
      result << "\n"
    end
    puts "\n\n"
    puts result
    puts "\n\n"
  end

  def populate
    @grid = generate_matches.each_slice(@grid.length).to_a
  end

  def possible_values
    uniq_nums = (1..(@grid.length * @grid.length / 2)).to_a
    result_array = [[uniq_nums], [uniq_nums]].flatten
    result_array.shuffle
  end

  def generate_matches
    card_matches = []
    # debugger
    possible_values.each do |val|
      card_matches << Card.new(val)
    end
    card_matches
  end

  def reveal(g_pos)
    card = @grid[g_pos[0]][g_pos[1]]
    card.reveal
  end

  def won?
    @grid.flatten.all? { |sqr| sqr.value == "_" }
  end


end

# board = Board.new
# # board.generate_matches
# board.populate
# board.render
# board.reveal([1, 3])
# board.render
# p board.possible_values
# p board.generate_matches
