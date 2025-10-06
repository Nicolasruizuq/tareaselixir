defmodule Readcsv do
  def main do
    "clients.csv"
    |> Client.read_csv()
    |> filter_data_interest()
    |> Client.generate_message_clients(&generate_message/1)
    |> Util.show_message()
  end

  defp filter_data_interest(data) do
    data
    |> Enum.filter(fn (client) -> client.age < 21 end)
  end

  defp generate_message(client) do
    heigth = client.heigth |> Float.round(2)
    "Hola #{client.name}, tu edad es de #{client.age} años y " <>
    "tienes una altura de #{heigth}\n"
  end
end

Readcsv.main()
