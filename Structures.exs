defmodule Structures do
  def main do
    "\nIngrese los datos del cliente: "
    |> Client.enter(:clients)
    |> generate_message_clients()
    |> Util.show_message()
  end

  defp generate_message(client) do
    heigth = client.heigth |> Float.round(2)
    "Hola #{client.name}, tu edad es de #{client.age} años y " <>
    "tienes una altura de #{heigth}\n"
  end
  defp generate_message_clients(clients_list) do
    clients_list
    |> Enum.map(&generate_message/1)
    |> Enum.join()
  end
end

Structures.main()
