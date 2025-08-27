defmodule Salary do
  def main do
    name = Util.introduce("Ingrese el nombre del empleado", :text)
    worked_hours = Util.introduce("Ingrese las horas trabajadas por el empleado", :text)
    |> to_float()
    hour_value = Util.introduce("Ingrese el valor por hora del empleado", :text)
    |> to_float()
    total_salary = calculate_total(worked_hours, hour_value)
    message = generate_message(name, worked_hours, total_salary)
    Util.show_message(message)
  end

  defp calculate_total(worked_hours, hour_value) do
    base_hours = 160
    overtime_rate = 1.25

    if worked_hours > base_hours do
      overtime_hours = worked_hours - base_hours
      base_salary = base_hours * hour_value
      overtime_salary = overtime_hours * hour_value * overtime_rate
      base_salary + overtime_salary
    else
      worked_hours * hour_value
    end
  end

  defp to_float(value) do
  case Float.parse(value) do
    {num, _} -> num
    :error ->
      case Integer.parse(value) do
        {num, _} -> num * 1.0
        :error -> 0.0
      end
  end
end

  defp generate_message(name, worked_hours, total_salary) do
   "Empleado: #{name}\nHoras trabajadas: #{worked_hours}\nSalario neto: $#{Float.round(total_salary, 2)}"
  end
end

Salary.main()
