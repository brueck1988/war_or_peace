require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def test_it_exists
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
    #require "pry"; binding.pry
  end

  def test_it_has_readable_attributes
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal player1, turn.player1
    assert_equal player2, turn.player2
    assert_equal [], turn.spoils_of_war
    #require "pry"; binding.pry
  end


  def test_type_basic
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal [], turn.spoils_of_war
    assert_equal :basic, turn.type
    #require "pry"; binding.pry
  end

  def test_type_mutually_assured_destruction
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:heart, 'Queen', 12)

    deck1 = Deck.new([card1, card2, card9, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal [], turn.spoils_of_war
    assert_equal :mutually_assured_destruction, turn.type
    #require "pry"; binding.pry
  end

  def test_type_war
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:heart, 'Queen', 12)

    deck1 = Deck.new([card1, card2, card9, card8])
    deck2 = Deck.new([card4, card3, card5, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal [], turn.spoils_of_war
    assert_equal :war, turn.type
    #require "pry"; binding.pry
  end

  def test_winner_basic_player1
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    winner = turn.winner

    assert_equal player1, turn.winner
  end

  def test_winner_basic_player2
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck2)
    player2 = Player.new("Aurora", deck1)

    turn = Turn.new(player1, player2)

    winner = turn.winner

    assert_equal player2, turn.winner
  end

  def test_winner_war_player1
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:heart, 'Queen', 12)

    deck1 = Deck.new([card1, card2, card9, card8])
    deck2 = Deck.new([card4, card3, card5, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    winner = turn.winner

    assert_equal player1, turn.winner
  end

  def test_winner_war_player2
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:heart, 'Queen', 12)

    deck1 = Deck.new([card1, card2, card9, card8])
    deck2 = Deck.new([card4, card3, card5, card7])

    player1 = Player.new("Megan", deck2)
    player2 = Player.new("Aurora", deck1)

    turn = Turn.new(player1, player2)

    winner = turn.winner

    assert_equal player2, turn.winner
  end

  def test_winner_mutually_assured_destruction
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:heart, 'Queen', 12)

    deck1 = Deck.new([card1, card2, card9, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new("Megan", deck2)
    player2 = Player.new("Aurora", deck1)

    turn = Turn.new(player1, player2)

    winner = turn.winner

    assert_equal "No Winner", turn.winner
  end

  def test_pile_cards_basic
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)
    #require "pry"; binding.pry

    winner = turn.winner
    assert_equal :basic, turn.type
    #require "pry"; binding.pry
    assert_equal turn.spoils_of_war, turn.pile_cards
    assert_equal [card1, card3], turn.spoils_of_war
    assert_equal [card2, card5, card8], deck1.cards
    assert_equal [card4, card6, card7], deck2.cards
    #require "pry"; binding.pry
  end

  def test_pile_cards_war
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:heart, '8', 8)
    card5 = Card.new(:diamond, 'Jack', 11)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card3, card4])
    deck2 = Deck.new([card5, card6, card7, card8])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)
    #require "pry"; binding.pry

    winner = turn.winner
    assert_equal :war, turn.type

    #assert_equal turn.spoils_of_war, turn.pile_cards
    require "pry"; binding.pry
    assert_equal [card2, card5, card8], deck1.cards
    assert_equal [card3, card6, card7], deck2.cards
    assert_equal [card1, card3], turn.pile_cards

  end

end
