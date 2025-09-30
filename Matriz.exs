defmodule Matriz do
  def main do
    matrix = [[1,2,3],
     [4,5,6],
     [7,8,9]]

    submatrix = scroll_diagonal(matrix)
    IO.puts("diagonal principal: #{inspect(submatrix)}")
  end

    def scroll_diagonal([]), do: []

    def scroll_diagonal([[x | _] | lines]) do
     submatrix = Enum.map(lines, fn [_ | rest] -> rest end)

    [x | scroll_diagonal(submatrix)]
    end
  end
Matriz.main()
