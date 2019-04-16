#!/usr/bin/ruby 

require "dbi"

begin

	dbh = DBI.connect("DBI:Mysql:host=dbdwr.clb6mpgfyuyu.us-east-1.rds.amazonaws.com;database=db_itau;port=50450", "itau_user", "itaupass")

	sth = dbh.prepare("SELECT error, power_mode, comm_period FROM cmd_tosend WHERE id_device=? AND sendit=1 ORDER BY id_cmd DESC LIMIT 1")

	sth.execute(10)

	sth.fetch do |row|
		puts "teste"
		printf "\nError: %d, Power_mode : %d\n", row[0], row[1]
		printf "comm_period: %d\n", row[2]
	end
	sth.finish

rescue DBI::DatabaseError => e
     puts "An error occurred"
     puts "Error code:    #{e.err}"
     puts "Error message: #{e.errstr}"
ensure
     # disconnect from server
     dbh.disconnect if dbh
end


