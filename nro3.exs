defmodule IntegerEntrance do
  def main do
    total_value = "Ingrese valor total de la factura: "
    |> Util.enter(:integer)
    delivered_value = "Ingrese valor entregado para el pago: "
    |> Util.enter(:integer)
    calculate_return(delivered_value, total_value)
    |> generate_message()
    |> Util.show_message()
  end
  defp calculate_return(delivered_value, total_value) do
    delivered_value - total_value
  end

  defp generate_message(return) do
  "El valor de devuelta es $ #{return}"
  end
end

IntegerEntrance.main()
