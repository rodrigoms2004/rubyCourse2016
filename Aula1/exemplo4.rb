# substitui todas as ocorrencias de "rato"
frase = "o rato roeu, o rato morreu"
frase.gsub!("rato", "gato")
puts frase

=begin
Este é um comentário
=end


# substitui somente a primeira ocorrencia de "rato"
frase = "o rato roeu, o rato morreu"
frase.sub!("rato", "gato")
puts frase
