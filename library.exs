defmodule Library do
  def main do
    name = "ingrese el nombre del libro: "
    |> Util.enter(:text)
    stock = "Ingrese la cantidad de unidades disponibles: "
    |> Util.enter(:integer)
    price = "Ingrese el precio unitario: "
    |> Util.enter(:float)
    stock_price = calculate_stock_price(stock, price)
    message = generate_message(name, stock_price)
    Util.show_message(message)
  end

  defp calculate_stock_price(stock, price) do
    price * stock
  end

  defp generate_message(name, stock_price) do
    "el libro #{name} tiene un precio de stock de #{stock_price}"
  end
end

Library.main()
