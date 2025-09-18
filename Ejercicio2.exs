cinema = %{room1: 70, room2: 45, room3: 20}
new_cinema = MapPractice.reserve_chairs(cinema, :room3, 25)
IO.inspect(new_cinema)
