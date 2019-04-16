
# imprimir um embaixo sem espaço em branco

retorno = "	07000	|	cupom fiscal	|	cupom emitido com sucesso	"
list = retorno.split("|")
puts codigo = list[0].strip
puts msg = list[1].strip
puts obs = list[2].strip


