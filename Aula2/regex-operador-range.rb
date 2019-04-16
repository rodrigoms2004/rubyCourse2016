regex = /^[0-9]/
p regex === "1algumacoisa"		# true

regex2 = /^[0-9][A-Z]$/
p regex2 === "0A"	# true
p regex2 === "2B"	# true
p regex2 === "9C"	# true
p regex2 === "9c"	# false
p regex2 === "C9"	# false
p regex2 === "9CZ"	# false
