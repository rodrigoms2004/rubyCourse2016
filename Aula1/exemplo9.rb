frase = "o rato roeu a roupa"
list1 = frase.split(' ')
puts list1.inspect

frase ="070000|cupom fiscal|cupom fiscal emitido com sucesso"
list2 = frase.split("|")
puts list2.inspect
codigo = list2[0]
msg = list2[1]
observacao = list2[2]

puts "codigo"
puts codigo
