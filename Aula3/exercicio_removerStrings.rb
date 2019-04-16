# remover somente as strings do array
list = [97, "teste", 10, 30, "omega"]
puts list.inspect
#list.delete_if{|x| x.is_a?(String)}
list.delete_if{|v| v.class == String}
puts list.inspect


