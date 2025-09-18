inventory = %{lechuga: 10, tomate: 20, pan: 30}
updated_inventory = MapPractice.update_inventory(inventory, :lechuga, 11)
IO.inspect(updated_inventory)
