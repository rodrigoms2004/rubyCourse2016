=begin
2) tendo a string "o gato foi a traz do rato que ao final fugiu do pato"
altere os elementos gato, pato e rato para "---" (três traços)
=end

str = "o gato foi a traz do rato que ao final fugiu do pato"
str.gsub!(/.ato/, "---")
p str

