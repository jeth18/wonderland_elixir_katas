defmodule CardGameWar.Game do

  defmodule Card do
    defstruct [:suits, :rank]
  end

  defmodule Player do
    defstruct [:name, :setCard]
  end

  def suits, do: [:spade, :club, :diamond, :heart]
  def ranks, do: [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
  def cards do
    for suit <- suits,
        rank <- ranks do
      %Card{suits: suit, rank: rank}
    end |> Enum.shuffle()
  end

  def repartir(cards) do
    cardPlayerOne = Enum.with_index(cards)
      |> Enum.filter(fn {card, index} ->
        if rem(index, 2) === 0, do: card
      end)
      |> Enum.map(fn {card, _} -> card end)

    cardPlayerTwo = Enum.with_index(cards)
      |> Enum.filter(fn {card, index} ->
        if rem(index, 2) !== 0, do: card
      end)
      |> Enum.map(fn {card, _} -> card end)

    {cardPlayerOne, cardPlayerTwo}
  end

  def start do
    {set1, set2} =repartir(cards())

    p1 = %Player{
      name: "Player1",
      setCard: set1
    }

    p2 = %Player{
      name: "Player2",
      setCard: set2
    }

    game(p1.setCard, p2.setCard)
  end

  def game(_, []), do: "Win Player 1"
  def game([], _), do: "Win Player 2"
  def game([h | t], [h2 | t2]) do
    rank1 = rankToValue(h.rank)
    rank2 = rankToValue(h2.rank)
    suit1 = suitToValue(h.suits)
    suit2 = suitToValue(h2.suits)

    cond do
      rank1 > rank2 -> game(t++[h2]++[h], t2)
      rank1 < rank2 -> game(t, t2++[h]++[h2])
      true ->
        if suit1 > suit2 do
          game(t++[h2]++[h], t2)
        else
          game(t, t2++[h]++[h2])
        end
    end
 end

  def rankToValue(rank) do
    cond do
      rank == :ace   -> 14
      rank == :king  -> 13
      rank == :queen -> 12
      rank == :jack  -> 11
      true -> rank
    end
  end

  def suitToValue(suit) do

    cond do
      suit == :heart   -> 4
      suit == :diamond -> 3
      suit == :club    -> 2
      true -> 1
    end
  end

end
