regex = /jpg$/

p regex === "abc.jpg" 	# retorna true
p regex === "foto.jpg" 	# retorna true
p regex === "foto.png" 	# retorna false

p regex =~ "abc.jpg" 	# imprime 4 primeira posição da string
p regex =~ "foto.jpg" 	# imprime 5
p regex =~ "foto.png" 	# retorna nil

