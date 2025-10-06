defmodule Client do
  defstruct name: "", age: 0, heigth: 0.0

  def create(name, age, heigth) do
    %Client{name: name, age: age, heigth: heigth}
  end
  def enter(message) do
    message
    |>Util.show_message()

    name =  "ingrese nombre: "
    |>Util.enter(:text)

    age = "ingrese edad: "
    |>Util.enter(:integer)

    heigth = "ingrese altura: "
    |>Util.enter(:float)
    create(name, age, heigth)
  end
  def enter(message, :clients) do
    message
    |> enter([], :clients)
  end
  defp enter(message, list, :clients) do
    client =
      message
      |>enter()
      new_list = list ++ [client]

      more_clients =
        "\n Ingresar mas clientes? (s/n): "
        |>Util.enter(:boolean)
        case more_clients do
          true ->
            message
            |> enter(new_list, :clients)
          false ->
            new_list
          end
  end
  def generate_message_clients(clients_list, parser) do
    clients_list
    |> Enum.map(parser)
    |> Enum.join()
  end

  def write_csv(clients, name) do
    clients
    |>generate_message_clients(&convert_client_line_csv/1)
    |>(&("nombre, edad, altura\n"<> &1)).() # adiciona los títulos
    |> (&File.write(name, &1)).()
  end

  defp convert_client_line_csv(client) do
    "#{client.name},#{client.age}, #{client.heigth}\n"
  end

  def read_csv(name) do
    name
    |> File.stream!()
    |> Stream.drop(1) # ignora los encabezados
    |> Enum.map(&convert_string_client/1)
  end

  defp convert_string_client(string) do
    [name, age, heigth] =
    string
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    age = age |> String.to_integer()
    heigth = heigth |> String.to_float()
    Client.create(name, age, heigth)
  end
end
