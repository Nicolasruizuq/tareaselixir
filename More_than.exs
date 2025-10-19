defmodule More_than do
  def main do
    list = [1,2,3,4,5,6]
    number = "ingrese un numero: "
    |> Util.enter(:integer)
    count = compare_numbers(list, number)
    IO.puts("hay #{count} mayores que #{number}")
  end

  defp compare_numbers([], _number), do: 0

  defp compare_numbers([x], number) do
    if x > number, do: 1, else: 0
  end

  defp compare_numbers(list, number) do
    half = div(length(list), 2)
    {left, right} = Enum.split(list, half)

    count_left = compare_numbers(left, number)
    count_right = compare_numbers(right, number)

    count_left + count_right
  end
end
More_than.main()
