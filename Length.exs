defmodule Length do
  def main do
    word = Util.introduce("Ingrese una palabra:", :text)
    letters = count_letters(word)
    message = generate_message(word, letters)
    |> Util.show_message()
  end

  defp generate_message(word, letters) do
    "la palabra #{word} tiene #{letters} letras"
  end

  defp count_letters(word) do
    String.length(word)
  end
end

Length.main()
