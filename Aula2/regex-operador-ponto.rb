regex = /.ato/

p regex === "pato"	#true
p regex === "rato"	#true
p regex === "gato"	#true
p regex === "lato"	#true

p regex === "o rato roeu"	#true
p regex =~ "o rato roeu"	#imprime 2

regex2 = /^.ato$/ 		# começa com qualquer letra, mas as três finais devem ser "ato"
p regex2 === "pato"		#true
p regex2 === "rato"		#true
p regex2 === "o rato"	#false

regex3 = /.ato$/		# qualquer letra seguida de ato, sem outro caractere
p regex3 === "o rato"	# true
p regex3 === "João tem um rato"	# true
p regex3 === "João tem um rato!" # false

regex4 = /^.ato/		# qualquer letra, começando com um caractere
regex4 === "ratos são terriveis" # true
regex4 === "o rato"	# false




