defmodule AlphabetCipher.Coder do

  def encode(keyword, message) do
    keyword = lengthKey(keyword, message)
    alpha = "abcdefghijklmnopqrstuvwxyz"

    cypher = for i <- 0..(String.length(message) - 1), into: [] do
      {position, _} = :binary.match(alpha, String.at(message, i))
      {positionKeyword, _} = :binary.match(alpha, String.at(keyword, i))
      {String.slice(alpha, position..-1) <> String.slice(alpha, 0..(position-1)), positionKeyword}
    end

    cypher |> Enum.reduce("", fn {str, index}, acc ->
      acc = acc <> String.at(str, index)
    end)
  end

  def decode(keyword, message) do
    "decodeme"
  end

  def decipher(cipher, message) do
    "decypherme"
  end

  def lengthKey(secretKey, message) do
    secretKey
      |> String.duplicate(div(String.length(message),String.length(secretKey))+1)
  end
end
