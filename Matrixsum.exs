defmodule Matrixsum do
  def main do
    matrix = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    total = matrix_addition(matrix)
    IO.puts("Suma total: #{total}")
  end

  def matrix_addition([]), do: 0

  def matrix_addition([row | tail]) do
    Enum.sum(row) + matrix_addition(tail)
  end
end

Matrixsum.main()
