defmodule Reverse do
  def main do
    list = [1,2,3,4,5,6]
    reversed_list = reverse_list(list)
    IO.inspect(reversed_list)
  end

  def reverse_list([]), do: []

  def reverse_list([head | tail])  do
    reversed_list = reverse_list(tail) ++ [head]

    reversed_list
  end
end

Reverse.main()
