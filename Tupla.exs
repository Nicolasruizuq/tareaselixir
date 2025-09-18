mi_tupla = {:ok, "Exito", 200}

elem(mi_tupla , 1)
nueva_tupla = put_elem(mi_tupla, 2, 404)
IO.inspect(nueva_tupla)

