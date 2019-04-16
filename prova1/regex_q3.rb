=begin
3) tendo a string "carlos@[1]adelson@[2]joao@[3]silva@[4]antonio@[5]vieira"
gere array contendo %w(carlos adelson joao silva antonio vieira)
=end

str = "carlos@[1]adelson@[2]joao@[3]silva@[4]antonio@[5]vieira"
p str.split(/@\[[1-5]\]/)

