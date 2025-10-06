defmodule ObjSum do
  def main do
    list = [1,2,3,4,5,6]
    target = 15
    IO.puts("Lista: #{inspect(list)}")
    IO.puts("Objetivo: #{target}")
    combinations = find_combinations(list, target)
    IO.inspect(combinations, label: "Combinaciones que suman #{target}")
  end

  def find_combinations(list, target) do
    do_find(list, target, [])
  end

  def do_find(_list, 0, current) do
    [Enum.reverse(current)]
  end

  def do_find([], _target, _current), do: []

  def do_find([head | tail], target, current) when head <= target do
    with_head = do_find(tail, target - head, [head | current])
    without_head = do_find(tail, target, current)

    with_head ++ without_head
  end

  def do_find([_head | tail], target, current) do
    do_find(tail, target, current)
  end
end

ObjSum.main()
