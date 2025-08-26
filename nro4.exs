defmodule RealEntrance do
  def main do
    total_value = "Ingrese valor total del producto: "
    |> Util.enter(:float)
    percentage_value = "Ingrese valor del descuento: "
    |> Util.enter(:float)
    discount_value = calculate_discount(total_value, percentage_value)
    final_value = calculate_final_value(total_value, discount_value)
    generate_message(discount_value, final_value)
    |> Util.show_message()
  end
  defp calculate_discount(total_value, percentage_value) do
    total_value * percentage_value
  end
  defp calculate_final_value(total_value, discount_value) do
    total_value - discount_value
  end
  defp generate_message(discount_value, final_value) do
    "El valor del descuento es $ #{discount_value} y el precio final es de $ #{final_value}"
  end
end

RealEntrance.main()
