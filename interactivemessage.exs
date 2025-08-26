defmodule DataEntrance do
  def main do
    "Ingrese nombre del empleado: "
    |> Util.introduce(:text)
    |> generate_message()
    |> Util.show_message()
  end

  defp generate_message (nombre) do
    "Bienvenido #{nombre} a la empresa Once Ltda"
  end
end

DataEntrance.main()
