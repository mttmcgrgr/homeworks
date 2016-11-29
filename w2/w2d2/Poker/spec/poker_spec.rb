require "card"
require "deck"
require "hand"
require "player"
require "game"
require "rspec"

describe Card do
  subject(:card) {Card.new( 9, "hearts")}

  describe "#value" do
    it "returns the value of the card" do
      expect(card.value).to eql(9)
    end
  end

  describe "suit" do
    it "returns the suit of the card" do
      expect(card.suit). to eql("hearts")
    end
  end

end

describe Deck do
  subject(:deck) {Deck.new}

  describe "#initialize" do
    it "creates a stack of 52 unique cards" do
      expect(deck.stack.count).to eql(52)
      expect(deck.stack.sample).to be_a(Card)
    end
  end
  describe "#deal" do
      it "removes the top n number of cards from the deck" do
          deck.deal(2)
          expect(deck.stack.count).to eql(50)
      end
      it "returns an array of cards that were dealt" do
         dealt_cards = deck.deal(2)
         expect(dealt_cards).to be_a(Array)
         expect(dealt_cards.sample).to be_a(Card)
         expect(dealt_cards.count).to eql(2)
      end
  end

end

describe Hand do
  let(:card1) {double('card1',  :value => 14, :suit => :hearts)}
  let(:card2) {double('card2', :value => 13, :suit => :hearts)}
  let(:card3) {double('card3',  :value => 12, :suit => :hearts)}
  let(:card4) {double('card4',  :value => 11, :suit => :hearts)}
  let(:card5) {double('card5',  :value => 10, :suit => :hearts)}
  let(:card6) {double('card6',  :value => 9, :suit => :hearts)}
  let(:card7) {double('card7',  :value => 9, :suit => :diamonds)}
  let(:card8) {double('card8',  :value => 9, :suit => :clubs)}
  let(:card9) {double('card9',  :value => 9, :suit => :spades)}
  let(:card10) {double('card10',  :value => 10, :suit => :spades)}

  let(:hand10) {Hand.new([card1, card2, card3, card4,card5])}
  let(:hand9) {Hand.new([card2, card3, card4, card5, card6])}
  let(:hand8) {Hand.new([card1, card9, card8, card7, card6])}
  let(:hand7) {Hand.new([card10, card5, card8, card7, card6])}
  let(:hand3) {Hand.new([card1, card10, card5, card7, card6])}
  let(:hand1) {Hand.new([card1, card2, card3, card4, card7])}

  describe "#initialize" do
    it "stores an array of 5 cards" do
        expect(hand10.cards.length).to eql(5)
        expect(hand10.cards).to be_a(Array)
    end

    describe "#values" do

      it "recognizes a royal flush" do
        expect(hand10.value).to eql(10)
      end

      it "recognizes a straight flush" do
        expect(hand9.value).to eql(9)
      end

      it "recognizes four of a kind" do
        expect(hand8.value).to eql(8)
      end

      it "recognizes a full house" do
        expect(hand7.value).to eql(7)
      end

      it "recognizes a two pair" do
        expect(hand3.value).to eql(3)
      end

      it "recognizes a high card hand" do
        expect(hand1.value).to eql(1)
      end

    end
  end

end
