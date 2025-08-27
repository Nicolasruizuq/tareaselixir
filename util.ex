defmodule Util do
  @moduledoc """
  Modulo con funciones que se reutilizan
  - autor: Nicolás Ruiz
  - fecha: 19/08/25
  - licencia GPU GPL v3
  """
    def show_message(message) do
      System.cmd("java",["Dialog", message])
    end
    def introduce(message, :text) do
      {output, _status} = System.cmd("java", ["-jar", "InputDialog.jar", "input", message])
      String.trim(output)
    end

   def enter(message, :text) do
    message
    |> IO.gets()
    |> String.trim()
   end

   def enter(message, :integer) do
    try do
      message
      |> enter(:text)
      |> String.to_integer()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un número entero\n"
        |> show_error()
        message
        |> enter(:integer)
    end
   end

   def enter(message, :float) do
    try do
      message
      |> enter(:text)
      |> String.to_float()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un número real\n"
        |> show_error()
        message
        |> enter(:float)
    end
   end

  def show_error(message) do
    IO.puts(:standard_error, message)
  end
end
