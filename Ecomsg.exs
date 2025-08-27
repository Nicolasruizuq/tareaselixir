defmodule Ecomsg do
  def main do
    Util.introduce("Ingrese un mensaje:", :text)
    |> String.upcase()
    |> generate_message()
    |> Util.show_message()
  end

  defp generate_message (message) do
    "#{message}"
  end
end

Ecomsg.main()
