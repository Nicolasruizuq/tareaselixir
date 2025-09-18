defmodule PasswordValidator do
  @min_length 8

  def validate(password) when is_binary(password) do
    errors =
      []
      |> check_length(password)
      |> check_uppercase(password)
      |> check_digit(password)
      |> check_no_spaces(password)

    case errors do
      [] ->
        {:ok, "Contraseña segura"}
      _ ->
        {:error, Enum.join(errors, "; ")}
    end
  end

  defp check_length(errors, password) do
    if String.length(password) >= @min_length, do: errors, else: errors ++ ["Debe tener al menos #{@min_length} caracteres"]
  end

  defp check_uppercase(errors, password) do
    if password != String.downcase(password), do: errors, else: errors ++ ["Debe contener al menos una letra mayúscula"]
  end

  defp check_digit(errors, password) do
    digits = ~w(0 1 2 3 4 5 6 7 8 9)
    if String.contains?(password, digits), do: errors, else: errors ++ ["Debe contener al menos un número"]
  end

  defp check_no_spaces(errors, password) do
    if String.length(String.replace(password, " ", "")) == String.length(password), do: errors, else: errors ++ ["No debe contener espacios"]
  end
end

defmodule Main do
  def run do
    password = IO.gets("Ingrese la contraseña: ") |> String.trim()
    IO.inspect(PasswordValidator.validate(password))
  end
end

Main.run()
