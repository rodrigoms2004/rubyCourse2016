#!/usr/ruby -w

require 'dbi'

def record_info(remote_data)
    # split data fields by pipe |
    split_fields = remote_data.split('|')
    
    # get device ID using regex
    regex_id_full=/^DWR.*:/
    regex_id=/[0-9]{1,}/
    id_device=split_fields[0].match(/^DWR.*:/).to_s.chop.match(regex_id).to_s

    # get IMEI from device
    regex_IMEI=/\:\ [0-9]{0,15}/
    imei=split_fields[0].match(regex_IMEI).to_s.delete": "

    # get status and temperature data
    # split_fields[1][0] = status | split_fields[1][1] = temperature
    # uses getStatus
    status=getStatus(split_fields[1][0])
    # uses getTemperature 
    temperature=getTemperature(split_fields[1][1])

    # get number of cells
    n_cells=split_fields[2].to_s

    # use regex to create an array of cells
    regex_cell = /^.*,.*,.*,.*,.*/
    cell_array=split_fields.select{|v| v.match(regex_cell)}

	# Testing everything
    puts ("Device ID: #{id_device} | Device IMEI #{imei}")
	puts ("Status: Power #{status[0].to_s} | Move #{status[1].to_s} | CommPeriod #{status[2]}")
	puts ("Temperature: #{temperature} | Number of cells: #{n_cells}")
	cell = Array.new
	cell_array.each do |c|
		cell=c.to_s.split(",")
		puts("MCC=#{cell[0]} | MNC=#{cell[1]} | LAC =#{cell[2]} | CELLID =#{cell[3]} | RSSI =#{cell[4]}|| TA=#{cell[5]}")
	end	

	begin
		# connect to the MySQL server
		#dbh = DBI.connect("DBI:Mysql:db_itau:172.16.128.128", "itau_user", "itaupass")
	    #dbh = DBI.connect("DBI:Mysql:host=172.16.128.128;database=db_itau;port=3306", "itau_user", "itaupass")	
		dbh = DBI.connect("DBI:Mysql:host=dbdwr.clb6mpgfyuyu.us-east-1.rds.amazonaws.com;database=db_itau;port=50450", "itau_user", "itaupass")

		# insert data of captures
		sth1 = dbh.prepare("INSERT INTO remotecaptures(
										id_device, 
										imei, 
										temperature,
										pwr, 
										move, 
										comm_period, 
										timestp) 
										VALUES(?, ?, ?, ?, ?, ?, now())")

		sth1.execute(id_device.to_i, imei, temperature, status[0].to_i, status[1].to_i, status[2].to_i)

		# insert data of cells
		sth2 = dbh.prepare("INSERT INTO celldata(
                              id_cap, MCC, MNC, LAC, CELLID, RSSI, TA) 
                              VALUES((SELECT id_cap FROM remotecaptures WHERE id_device = ? ORDER BY id_cap DESC LIMIT 1),
                                    ?, ?, ?, ?, ?, ?)")

		cell_array.each do |c|
			#c = cell_array[0]
			cell=c.to_s.split(",")
			sth2.execute(id_device.to_i, cell[0], cell[1], cell[2], cell[3], cell[4].to_i, cell[5])
		end	

		# prepare a response to module, get the last config
		sth3 = dbh.prepare("SELECT error, power_mode, comm_period, sendit FROM cmd_tosend WHERE id_device=? AND sendit=1 ORDER BY id_cmd DESC LIMIT 1")
		sth3.execute(id_device.to_i)
	
		response = String.new	
		sendit   = String.new
		sth3.fetch do |row|
			error 		= row[0]
			power_mode 	= row[1]
			comm_period = row[2]
			sendit		= row[3]
			response = setStatus(error, power_mode, comm_period)
			#puts "send it is #{sendit}"
		end

		
		sth1.finish
		sth2.finish
		sth3.finish
	
		dbh.commit
		puts "Record has been created"
		#puts ("Response will be #{response}")
		if (sendit.to_i == 0)
			return "\0<"
		elsif (sendit.to_i == 1)
			return response
		end

#INSERT INTO celldata(id_cap, MCC, MNC, LAC, CELLID, RSSI, TA) VALUES
#		((SELECT id_cap FROM remotecaptures WHERE id_device = 10 ORDER BY id_cap DESC LIMIT 1),
#		 "724","11","849","43d7","18","2");


	rescue DBI::DatabaseError => e
     	puts "An error occurred"
     	puts "Error code:    #{e.err}"
   		puts "Error message: #{e.errstr}"
    	dbh.rollback
	ensure
    	# disconnect from server
     	dbh.disconnect if dbh

	end

	# Sent "\0<" and module receives it:
    #Buffer[208]    unsigned char   0 '\0' (Default)    
    #Buffer[209]    unsigned char   60 '<' (Default)    
    #Buffer[210]    unsigned char   10 '\n' (Default)   
    #Buffer[211]    unsigned char   13 '\r' (Default)

    #result_code = "\0<"

end


