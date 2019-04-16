texto = "primeira frase\n"
texto << "segunda frase\n"
texto << "terceira frase\n"

texto.each_line do |linha|
 puts linha
end
