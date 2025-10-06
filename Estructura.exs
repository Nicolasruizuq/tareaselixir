defmodule Estructura do
  def main do
    "Ingrese los datos del cliente: "
    |>Cliente.enter()
    |>generate_message()
    |>Util.show_message
  end
  def generate_message(cliente) do
    altura = cliente.altura |> Float.round(2)
    "Hola #{cliente.nombre}, tu edad es de #{cliente.edad} años y " <> "tienes una altura de #{altura}\n"
  end
end
Estructura.main()
