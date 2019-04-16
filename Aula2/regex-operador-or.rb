p "/(g|p|r)ato/"
regex = /(g|p|r)ato/ # valida palavras com letras iniciais g ou p ou r
p regex === "pato"	#true
p regex === "rato"	#true
p regex === "gato"	#true
p regex === "o rato" # true
p regex === "ato"	# false
p regex === "lato"	# false

p "/^(g|p|r)/"
regex2 = /^(g|p|r)/ # valida palavras iniciadas com g ou p ou r
p regex2 === "pato"	#true
p regex2 === "rato"	#true
p regex2 === "gato"	#true
p regex2 === "o rato" # false

p "/(g|p|r)$/"
regex3 = /(g|p|r)$/ # valida palavras finalizadas com g ou p ou r, sem nada depois
p regex3 === "dog"	#true
p regex3 === "raptor"	#true
p regex3 === "pap"	#true
p regex3 === "the raptor" # true
p regex3 === "the raptor is feral" # false


