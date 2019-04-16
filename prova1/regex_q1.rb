=begin
1) Crie uma expressão regular que valide a string:
"Sao Paulo, 7 de setembro de 2012"
Sendo "," e "de" obrigatorios, e o dia e ano validados como numero observando
o tamho 2 => mes 4 => ano
=end

str = "Sao Paulo, 7 de setembro de 2012"
regex = /^([A-Z][a-z]{2,25}|[A-Z][a-z]{2,25} [A-Z][a-z]{2,25})\,\ (|[1-3])[0-9]\ de\ [a-z]{0,10}\ de\ [0-9]{4}$/

p regex === str

