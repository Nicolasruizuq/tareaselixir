defmodule Csv do
  def main do
    create_clients_list()
    |> Client.write_csv("clients.csv")
  end
  defp create_clients_list() do
    [Client.create("Ana", 19, 1.65), Client.create("Camilo", 18, 1.75), Client.create("Andres", 21, 1.65), Client.create("Andres", 18, 1.75), Client.create("Jaider", 18, 1.72), ]
  end
end
Csv.main()
