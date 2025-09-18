defmodule EjemploReduce do
def main do
IO.puts(Enum.reduce([2, 4, 6, 8], 2, fn (x, acc) -> x + acc end) |> inspect())
end
end
EjemploReduce.main()
