frase = "o rato roeu"
# da esquerda para a direita
puts frase.index "r"

# da direita para a esquerda
puts frase.rindex "r"

i = 0
l = Array.new
while (i < frase.size)
	l << frase.index("r", i) # busque "r" a partir da posição i
	i += 1
end
puts l.uniq.compact.inspect

=begin
uniq = remove repetidos
compact = remove todos os nils do array
=end
