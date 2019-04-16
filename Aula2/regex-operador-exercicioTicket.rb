regex = /^Ticket_{1,1}[1-9][0-9]{0,4}$/

teste1 = "ticket_0"
teste2 = "ticket_1a"
teste3 = "aticket_1"

teste4 = "Ticket_1"
teste5 = "Ticket_100"
teste6 = "Ticket_1000"
teste7 = "Ticket_2550"
teste8 = "Ticket_99999"

p regex === teste1	# 
p regex === teste2	# 
p regex === teste3	# 
p regex === teste4	# 
p regex === teste5	# 
p regex === teste6	# 
p regex === teste7	# 
p regex === teste8	# 
