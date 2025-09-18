defmodule Fuel do
  def main do
    name = "ingrese su nombre: "
    |> Util.enter(:text)
    distance = "Ingrese la distancia recorrida: "
    |> Util.enter(:float)
    fuel = "Ingrese la cantidad de combustible que ha consumido: "
    |> Util.enter(:float)
    performance = calculate_performance(distance, fuel)
    message = generate_message(name, performance)
    Util.show_message(message)
  end

  defp calculate_performance(distance,fuel) do
    distance/fuel
  end

  defp generate_message(name, performance) do
    formatted = :io_lib.format("~.2f", [performance]) |> IO.iodata_to_binary()
    "#{name} el rendimiento de su vehiculo es de #{formatted} km/L"
  end
end

Fuel.main()
