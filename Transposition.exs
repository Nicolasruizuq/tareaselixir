defmodule Transposition do
  def main do
    matrix = [[1,2,3], [4,5,6], [7,8,9]]
    transposed = trans_matrix(matrix)
    IO.inspect(transposed)
  end

  def trans_matrix([]), do: []

  def trans_matrix(matrix) do
    if hd(matrix) == [] do
      []
    else
      [Enum.map(matrix, &hd/1) | trans_matrix(Enum.map(matrix, &tl/1))]
    end
  end
end
Transposition.main()
