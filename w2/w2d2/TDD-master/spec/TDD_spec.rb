require "TDD"
require "rspec"

describe Array do
  describe "#my_uniq" do
    subject(:arr) {[1,2,1,2,4]}

    it "returns an array" do
      expect(arr.my_uniq).to be_a(Array)
    end

    it "does not alter original array" do
      dup = arr.dup
      arr.my_uniq
      expect(dup).to eql(arr)
    end


    let(:arr1) {[]}
    it "should return an empty array if array is empty" do

      expect(arr1.my_uniq).to eql([])
    end

    it "should return an array with no duplicates" do
      uniq = arr.my_uniq
      result = uniq.none? {|el| uniq.count(el) > 1}
      expect(result).to be true
    end

    it "returns array of sorted elements" do
      expect(arr.my_uniq).to eql([1,2,4])
    end
  end

  describe "#two_sum" do
    subject(:arr){[-1,0,2,-2,1]}

    it "returns pairs of positions whose elemetns sum to zero" do
      expect(arr.two_sum).to eql([[0,4],[2,3]])
    end

    it "returns sorted smaller index before bigger index" do
      expect(arr.two_sum).to eql(arr.two_sum.sort)
    end


    it "does not include any pair of indexes that doesn't sum to zero" do
      result = arr.two_sum.all? {|el| arr[el.first] + arr[el.last] == 0}
      expect(result).to be true
    end

  end

  describe "#my_transpose" do
    subject(:rows) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}

    it "works for a square array" do
      expect(rows.my_transpose).to eql([[0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]])
    end

    let(:rows2) {[
    [0, 1],
    [3, 4],
    [6, 7]
  ]}
    it "works for a rectangular array" do
      expect(rows2.my_transpose).to eql([[0,3,6],[1,4,7]])
    end

    let(:rows3) {[
    [0, 1, 5],
    [3, 4],
    [6, 7]
  ]}
    it "works for uneven matricies" do
      expect(rows3.my_transpose).to eql([[0,3,6],[1,4,7],[5, nil, nil]])
    end


  end

  describe "#stock_picker" do
    subject(:day_prices) {[2,1,3,5,6,7,9,4,5,6]}


    it "buys before it sells" do
      result = day_prices.stock_picker
      expect(result.first).to be < (result.last)
    end

    it "returns an array of the best buy and best sell day" do
      expect(day_prices.stock_picker).to eql([1,6])
    end
  end

end

describe Towers_Hanoi do
  let(:win_tower) {Towers_Hanoi.new([[],[3,2,1],[]])}
  let(:bad_tower) {Towers_Hanoi.new([[3],[2,1],[]])}

  describe "#move" do
    it "does not move a larger piece on top of a smaller piece" do
      expect{bad_tower.move(0,1)}.to raise_error("You can't do that!")
      # bad_tower.move(0,2)
      # expect()

    end

  end

  describe "#won?" do

    it "checks if the first tower is empty and another tower includes all discs" do
      expect(win_tower.won?).to be true
      expect(bad_tower.won?).to be false
    end


  end

end
