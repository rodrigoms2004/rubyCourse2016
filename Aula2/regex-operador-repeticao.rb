regex = /^[0-9]{3,5}$/ # numeros, com minimo de tres casas e máximo de 5 casas

p regex === "1"	# false
p regex === "2" # false
p regex === "123" # true
p regex === "1234" # true
p regex === "12345" # true
p regex === "12340" # true
p regex === "123456" # false

p "EXEMPLO2"
regex2 = /^[0-9]{3,5}[a-z]{2,4}$/ # inicia de 0 a 9 de 3 a 5 casas, de a-z com 2 a 4 casas
p regex2 === "123ab"		# true
p regex2 === "12ab"			# false, menos de 3 casas numericas
p regex2 === "123abc"	    # true
p regex2 === "123456abc"	# false, mais de 5 casas numericas
p regex2 === "123abcde"		# false, mais de 4 casas alfabeticas
p regex2 === "1b"			# false, menis de 3 casas numericas e menis de duas casas alfabeticas

p "EXEMPLO3"
regex3 = /^(r|p|g){1,3}/
p regex3 === "rpg"	# true
p regex3 === "abc"	# false
