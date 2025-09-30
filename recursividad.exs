defmodule Recursividad do

    def main do
        list = [1,2,3,4,5]
        sumar(list)
    end

    def sumar(list), do: sumar(list, 0, length(list)-1)

    def sumar(list, acum, 0) do: value = Enum.at(list,0)

    def sumar (list,acum,indicator) do
        suma(list,acum + value, indicator - 1)
    end


end
