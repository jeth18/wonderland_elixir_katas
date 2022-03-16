defmodule CardGameWar.GameTest do
  use ExUnit.Case

  test "the highest rank wins the cards in the round" do
     assert "Win Player 1" ==
      CardGameWar.Game.game([%{suits: :spade, rank: 9}],[%{suits: :spade, rank: 2}])
  end

  test "queens are higher rank than jacks" do
    assert "Win Player 1" ==
      CardGameWar.Game.game([%{suits: :spade, rank: :queen}],[%{suits: :spade, rank: :jack}])
  end

  test "kings are higher rank than queens" do
     assert "Win Player 1" ==
      CardGameWar.Game.game([%{suits: :spade, rank: :king}],[%{suits: :spade, rank: :queen}])
  end

  test "aces are higher rank than kings" do
    assert "Win Player 2" ==
      CardGameWar.Game.game([%{suits: :spade, rank: :king}],[%{suits: :spade, rank: :ace}])
  end

  # test "if the ranks are equal, clubs beat spades" do
  #   flunk("not implemented")
  # end

  # test "if the ranks are equal, diamonds beat clubs" do
  #   flunk("not implemented")
  # end

  # test "if the ranks are equal, hearts beat diamonds" do
  #   flunk("not implemented")
  # end

  # test "the player loses when they run out of cards" do
  #   flunk("not implemented")
  # end

end
