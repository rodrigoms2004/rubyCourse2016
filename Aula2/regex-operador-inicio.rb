regex = /^bom/

puts regex === "bom dia" 	# retorna true
puts regex === "boa noite" 	# retorna false

puts regex =~ "bom dia" 	# imprime 0 primeira posição da string
puts regex =~ "boa noite" 	# imprime nil pois não coincide com a string
