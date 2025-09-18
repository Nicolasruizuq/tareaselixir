defmodule ShippingCalculator do
  def base_fee(weight) when is_number(weight) and weight > 0 and weight <= 15 do
    cond do
      weight <= 5 -> 10_000
      weight <= 15 -> 20_000
    end
  end

  def base_fee(weight) when is_number(weight) and weight > 15 do
    cond do
      weight > 15 -> 30_000
    end
  end

  def base_fee(_), do: raise(ArgumentError, "Peso inválido")

  def discount(:corporativo), do: 0.10
  def discount(:estudiantil), do: 0.15
  def discount(:regular), do: 0.0
  def discount(_), do: 0.0

  def recharge(:express), do: 0.25
  def recharge(:estandar), do: 0.0
  def recharge(_), do: 0.0

  defp apply_discount(map, client) do
    d = map.base * discount(client)
    map
    |> Map.put(:discount, d)
    |> Map.put(:subtotal, map.base - d)
  end

  defp apply_recharge(map, service) do
    r = map.subtotal * recharge(service)
    map
    |> Map.put(:recharge, r)
    |> Map.put(:total, map.subtotal + r)
  end

  def calculate_total(weight, client, service) do
    %{}
    |> Map.put(:base, base_fee(weight))
    |> apply_discount(client)
    |> apply_recharge(service)
  end
end

defmodule Utils do

  def format_pesos(valor) when is_integer(valor), do: Integer.to_string(valor)
  def format_pesos(valor) when is_float(valor), do: Integer.to_string(round(valor))
  def format_pesos(valor), do: to_string(valor)
end

defmodule Main do
  def run do
    weight = get_weight()
    client = get_client()
    service = get_service()

    result = ShippingCalculator.calculate_total(weight, client, service)

    IO.puts("\n--- Detalle del envío ---")
    IO.puts("Tarifa base: $#{Utils.format_pesos(result.base)}")
    IO.puts("Descuento aplicado: $#{Utils.format_pesos(result.discount)}")
    IO.puts("Recargo aplicado: $#{Utils.format_pesos(result.recharge)}")
    IO.puts("Total a pagar: $#{Utils.format_pesos(result.total)}")
  end

  defp get_weight do
    input =
      IO.gets("Ingrese el peso del paquete (kg): ")
      |> case do
        nil -> ""
        s -> String.trim(s)
      end

    if input == "" do
      IO.puts("Entrada vacía. Intenta de nuevo.")
      get_weight()
    else
      case Float.parse(input) do
        {v, rest} ->
          if String.trim(rest) == "" and v > 0 do
            v
          else
            IO.puts("Peso inválido. Ingresa un número positivo (ej. 2.5).")
            get_weight()
          end

        :error ->
          IO.puts("Entrada inválida. Ingresa un número (ej. 2.5).")
          get_weight()
      end
    end
  end

  defp get_client do
    input =
      IO.gets("Ingrese el tipo de cliente (corporativo/estudiantil/regular): ")
      |> case do
        nil -> ""
        s -> String.trim(s) |> String.downcase()
      end

    cond do
      input in ["corporativo", "corp"] -> :corporativo
      input in ["estudiantil", "estudiante", "est"] -> :estudiantil
      input in ["regular", "reg"] -> :regular
      true ->
        IO.puts("Cliente no reconocido. Intenta: corporativo, estudiantil o regular.")
        get_client()
    end
  end

  defp get_service do
    input =
      IO.gets("Ingrese el tipo de servicio (express/estandar): ")
      |> case do
        nil -> ""
        s -> String.trim(s) |> String.downcase()
      end

    cond do
      input in ["express", "expres", "exp"] -> :express
      input in ["estandar", "estándar", "est"] -> :estandar
      true ->
        IO.puts("Servicio no reconocido. Intenta: express o estandar.")
        get_service()
    end
  end
end

Main.run()
