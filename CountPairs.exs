defmodule CountPairs do
  def main do
    list = [1,2,3,4,5,6]
    even_numbers = count_pairs(list)
    IO.puts("el numero de pares en la lista es de #{even_numbers}")
  end

  def count_pairs([]), do: 0

  def count_pairs([head | tail]) when rem(head, 2) == 0 do
    1 + count_pairs(tail)
  end

  def count_pairs([_head | tail]) do
    count_pairs(tail)
  end
end

CountPairs.main()
