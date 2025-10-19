defmodule Traveling_problem do

  @distancias %{
    {0, 0} => 0,  {0, 1} => 10, {0, 2} => 15, {0, 3} => 20,
    {1, 0} => 10, {1, 1} => 0,  {1, 2} => 35, {1, 3} => 25,
    {2, 0} => 15, {2, 1} => 35, {2, 2} => 0,  {2, 3} => 30,
    {3, 0} => 20, {3, 1} => 25, {3, 2} => 30, {3, 3} => 0
  }

  def main do
    args = System.argv()
    inicio = parse_inicio(args, 0)
    ciudades = Enum.to_list(0..3)
    restantes = List.delete(ciudades, inicio)
    {dist_min, ruta} = tsp(inicio, restantes, inicio, @distancias)
    ruta_completa = ruta ++ [inicio]
    IO.puts("Ruta óptima: #{inspect(ruta_completa)}")
    IO.puts("Distancia total: #{dist_min}")

  end

  def main(args) when is_list(args) do
    inicio = parse_inicio(args, 0)
    main_with_start(inicio)
  end

  defp main_with_start(inicio) do
    ciudades = Enum.to_list(0..3)
    restantes = List.delete(ciudades, inicio)
    {dist_min, ruta} = tsp(inicio, restantes, inicio, @distancias)
    ruta_completa = ruta ++ [inicio]
    IO.puts("Ruta óptima (inicio #{inicio}): #{inspect(ruta_completa)}")
    IO.puts("Distancia total: #{dist_min}")
  end

  defp parse_inicio([], default), do: default

  defp parse_inicio(args, _default) do
    case args do
      [first | _] ->
        case Integer.parse(first) do
          {n, _} -> n
          :error -> 0
        end

      _ -> 0
    end
  end

  defp tsp(actual, [], inicio, distancias) do
    distancia_vuelta = Map.get(distancias, {actual, inicio}, :infinito)
    {distancia_vuelta, [actual]}
  end

  defp tsp(actual, restantes, inicio, distancias) do
    restantes
    |> Enum.map(fn ciudad ->
      nuevos_restantes = List.delete(restantes, ciudad)
      {dist_sub, ruta_sub} = tsp(ciudad, nuevos_restantes, inicio, distancias)
      costo = Map.get(distancias, {actual, ciudad}, :infinito)
      {total, ruta} =
        case dist_sub do
          :infinito -> {:infinito, []}

          _ -> {costo + dist_sub, [actual | ruta_sub]}
        end

      {total, ruta}
    end)
    |> Enum.reject(fn {dist, _ruta} -> dist == :infinito end)
    |> case do
      [] -> {:infinito, []}

      lista -> Enum.min_by(lista, fn {d, _} -> d end)
    end
  end
end
Traveling_problem.main()
