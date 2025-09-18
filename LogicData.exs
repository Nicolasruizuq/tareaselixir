defmodule LogicData do
  def main do
    id = "ingrese la cedula: "
    |> Util.enter(:integer)
    discount = define_discount(id)
  end

  defp define_discount(id) do
    when rem(numero_cliente, dia_semana) == 0, do: true
  end
end
