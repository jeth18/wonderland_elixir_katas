defmodule AlphabetCipher.Coder do

  def encode(keyword, message) do
    keyword = lengthKey(keyword, message)
    alpha = "abcdefghijklmnopqrstuvwxyz"

    for i <- 0..(String.length(message) - 1), into: [] do
      {position, _} = :binary.match(alpha, String.at(message, i))
      {positionKeyword, _} = :binary.match(alpha, String.at(keyword, i))
      {String.slice(alpha, position..-1) <> String.slice(alpha, 0..(position-1)), positionKeyword}
    end |> Enum.reduce("", fn {str, index}, acc ->
      acc <> String.at(str, index)
    end)
  end

  def decode(keyword, message) do
    keyword = lengthKey(keyword, message)
    alpha = "abcdefghijklmnopqrstuvwxyz"

    for i <- 0..(String.length(message) - 1), into: [] do
      {positionKeyword, _} = :binary.match(alpha, String.at(keyword, i))
      text = String.slice(alpha, positionKeyword..-1) <> String.slice(alpha, 0..(positionKeyword-1))
      {index, _} = :binary.match(text, String.at(message, i))
      index
    end |> Enum.reduce("", fn index, acc ->
      acc <> String.at(alpha, index)
    end)
  end


  def decipher(cipher, message) do
    "decipher"
  end

  def lengthKey(secretKey, message) do
    secretKey
      |> String.duplicate(div(String.length(message),String.length(secretKey))+1)
  end
end
