#!/usr/bin/ruby -w

require "dbi"

begin
	# connect to the MySQL server
	dbh = DBI.connect("DBI:Mysql:db_itau:172.16.128.128","itau_user", "itaupass")

	# get server version string and display it
	row = dbh.select_one("SELECT VERSION()")
	puts "Server version: " + row[0]
rescue DBI::DatabaseError => e
	puts "An error occured"
	puts "Error code:	 #{e.err}"
	puts "Error message: #{e.errstr}"
ensure
	# disconnect from server
	dbh.disconnect if dbh

end

