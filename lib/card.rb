class Card
  attr_reader :suit,
              :value,
              :rank
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end


  # def rank
    # @rank
  # end
end

#card1.rank