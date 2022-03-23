defmodule Doublets.SolverTest do
  use ExUnit.Case
  import Doublets.Solver

  test "with word links found" do
    assert ["head", "heal", "teal", "tell", "tall", "tail"] ==
           doublets("head", "tail")

    assert ["door", "boor", "book", "look", "lock"] ==
           doublets("door", "lock")

    assert ["bank", "bonk", "book", "look", "loon", "loan"] ==
           doublets("bank", "loan")

    assert ["wheat", "cheat", "cheap", "cheep", "creep", "creed", "breed", "bread"] ==
           doublets("wheat", "bread")
  end

  test "with no word links found" do
    assert [] == doublets("ye", "freezer")
  end

  test "last word" do
    assert nil == last_word([])

    assert "hola" == last_word(["hola"])

    assert "hello" == last_word(["hola", "hello"])
  end

  test "Distance letters equals" do
    assert  0 == distance("", "")

    assert 4 == distance("mundo", "hello")

    assert 1 == distance("real", "meal")

    assert 0 == distance("meal", "meal")

    assert 2 == distance("mealreal", "realmeal")
  end

  test "same length word of words.txt" do

	assert [] == same_length_words("h")

	assert [] == same_length_words("")

	assert [] == same_length_words("1111111111111111111111")

	assert ["ye"] == same_length_words("aa")

	assert ["ye"] == same_length_words("mm")

	assert [] == same_length_words("aaa")

	assert [] == same_length_words("mmm")

	assert ["begohm", "agamic", "genear", "muckle", "townet", "yawner",
 "Mpondo"] == same_length_words("111111")

	assert ["prudentialness", "preferableness", "pseudomorphose",
 "predictiveness"] == same_length_words("11111111111111")

	assert ["liken", "impar", "untie", "wheat", "cheat", "cheap", "cheep",
 "creep", "creed", "breed", "bread"] == same_length_words("hello")
  end

  test "Find variants to find same length word" do
	assert [] == find_variants("")

	assert [] == find_variants(" ")

	assert [] == find_variants("h")

	assert [] == find_variants("ho")

	assert [] == find_variants("ye")

	assert ["ye"] == find_variants("ie")

	assert ["sharewort"] == find_variants("charewort")

	assert ["task"] == find_variants("tast")

	assert ["freezer"] == find_variants("freeser")

	assert [] == find_variants("freeserr")
  end

  test "Complete sequence of variants in a map" do

	assert [] == complete_seq_variants([""])

	assert [] == complete_seq_variants(["hello"])

	assert [["moon", "loon"]] == complete_seq_variants(["moon"])

	assert [["tast", "task"]] == complete_seq_variants(["tast"])

	assert [["taso", "task"]] == complete_seq_variants(["taso"])

	assert [["pleywork", "playwork"]] == complete_seq_variants(["pleywork"])

	assert [["taso", "task"]] == complete_seq_variants(["taso"])

	assert [["pleywork", "talk", "task"], ["pleywork", "talk", "tall"]]
		== complete_seq_variants(["pleywork", "talk"])

	assert [["lool", "look"], ["lool", "loon"]] == complete_seq_variants(["lool"])
  end

  test "Find solution of sequence words" do

	assert nil ==  find_solution([], "")

	assert nil == find_solution([], "moon")

	assert ["taso", "task"] == find_solution([["taso", "task"]], "task")

	assert nil == find_solution([["taso", "task"]], "taso")

	assert ["moon", "loon"] == find_solution([["moon", "loon"]], "loon")

	assert ["taso", "task"] == find_solution([["taso", "task"],["moon", "loon"]], "task")

	assert ["moon", "loon"] == find_solution([["taso", "task"],["moon", "loon"]], "loon")

  end
end
