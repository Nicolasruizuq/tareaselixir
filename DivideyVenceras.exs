defmodule DiviceyVenceras do
  def main do

    list = [7,8,9,6,5,4]
    max_number = most(list)
    IO.puts("el numero mayor de la lista es #{max_number}")

  end

  def most([]), do: nil
  def most([x]), do: x
  def most(list) do
    {left, right} = Enum.split(list, div(length(list), 2))
    max(most(left), most(right))
  end
end
DiviceyVenceras.main()
