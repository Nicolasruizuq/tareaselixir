defmodule MapPractice do
    def update_inventory(inventory, product, sold_stock) do
      case Map.has_key?(inventory, product) do
      false ->
        IO.puts("Producto no encontrado")
        inventory
        true ->
        actual_stock = Map.get(inventory, product,0)

        if sold_stock > actual_stock do
          IO.puts("Stock insuficiente")
          inventory
        else
          new_inventory = Map.put(inventory, product, actual_stock - sold_stock)
          new_inventory
        end
      end
    end
    def analize_sales(performance) do
      total_sales = Enum.reduce(performance, 0, fn {_day, sale}, acc -> acc + sale end)
      daily_average = (total_sales/31)
      best_sale_day = Enum.max_by(performance, fn {_day, sale} -> sale end)
      report = case total_sales do
        0 ->
          {:performance, 0, 0, "no hay datos"}
        _ ->
          {:performance, total_sales, daily_average, best_sale_day}
      end
      report
    end
    def evaluate_project(class, name) do
      case Map.has_key?(class, name) do
      false ->
        {0, "No encontrado"}
      true ->
      actual_grades = Enum.reduce(Map.get(class, name), 0, fn grade, acc -> acc + grade end)
      average = actual_grades/3
      state = if average >= 6 do
          "approved"
      else
          "reprovated"
      end
      student_state = {:class, average, state}
      student_state
    end
  end
  def calculate_discount(products, discount) do
    if products == [] do
      {[], 0}
    else
      discounts_list = Enum.map(products, fn {name, price} ->
        final_price = price * (1 - discount/100)
        {name, final_price} end)

      total_discount = Enum.map(products, fn {_, price} ->
          price * (discount / 100)
        end)
        |> Enum.sum()
      {discounts_list, total_discount}
      end
  end
  def reserve_chairs(cinema, room, chairs) do
      case Map.has_key?(cinema, room) do
      false ->
        IO.puts("Sala no encontrada")
        cinema
        true ->
        available_chairs = Map.get(cinema, room, 0)

        if chairs > available_chairs do
          IO.puts("Sillas insuficientes")
          cinema
        else
          new_cinema = Map.put(cinema, room, available_chairs - chairs)
          new_cinema
        end
      end
    end
end
