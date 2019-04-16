# record data from remote devices
def record_log(remote_data)
    
    # get current date
    date = Time.now.to_s.match(/[0-9]{4}\-[0-9]{2}\-[0-9]{2}/).to_s
    # get current time
    time = Time.now.to_s.match(/[0-2]{1}[0-9]{1}\:[0-5]{1}[0-9]{1}\:[0-5]{1}[0-9]{1}/).to_s
    # directory where log files are stored
    logDir = "/var/log/cap_dwr/"
    # create filename
    logFilename = "cap"+date+".txt"
    # append remote_data to logfile
    logFile = File.new(logDir+logFilename, "a+")
    if logFile
		logFile.syswrite(remote_data+">>timestamp:"+time)
        logFile.syswrite("\n")
    else
        puts "Unable to open file"
    end
end


def printsomething
    puts ("print"+Time.now.to_s)
end

############################################################################
#
#		FUNCTIONS FOR CONVERSION
#
############################################################################

# receives a String and returns a Fixnum (Integer)
def ascii_to_decimal(ascii_data)
	if (ascii_data.class == String)
		n = 0
		ascii_data.each_byte do |c|
			n = c
		end
		return n
	else
		return -1
	end
end

# receives a String and returns a String
def ascii_to_binary(ascii_data)
	if (ascii_data.class == String)
		n = 0
		ascii_data.each_byte do |c|
			n = c
		end
		return n.to_s(2).rjust(8, "0")
	else
		return -1
	end
end

# receives a Fixnum and returns a String
def decimal_to_ascii(decimal_data)
	return decimal_data.chr
end

# receives a Fixnum and returns a String
def decimal_to_binary(decimal_data)
	return decimal_data.to_s(2).rjust(8, "0")
end

# receives String and returns a Fixnum
def binary_to_decimal(binary_data)
	return binary_data.to_i(2)
end

# receives a String and return a String
def binary_to_ascii(binary_data)
	return binary_data.to_i(2).chr
end


############################################################################
#
#		FUNCTIONS TO DEAL WITH DATA FROM MODULE
#
############################################################################


# receives a String and returns a Float
def getTemperature(temp_data)
	if (temp_data.class == String)
		binary_temp = ascii_to_binary(temp_data)	# converts ASCII to binary

		signal = 1									# defines if temperature is + or -
		if (binary_temp[0] == "1")					# "0" = positive | "1" = negative
			signal = -1
		end

		decimal_part = 0							# gets decimal part
		if (binary_temp[7] == "1")					# "0" = 0 | "1" = 0.5 °C
			decimal_part = 0.5
		end

		binary_temp.slice!(0)						# removes signal data
		binary_temp.chop!							# removes decimal data
		
		return ( (binary_to_decimal(binary_temp) + decimal_part) * signal )

	else
		return -1
	end
end

# receives a String and returns an array
def getStatus(status_data)
	if (status_data.class == String)

		status_array = Array.new						# Creates an array where data
														# is stored

		binary_status = ascii_to_binary(status_data)	# converts ASCII to binary

		status_array << binary_status[0]				# get power status, "0" = off "1" = on
														# and add it to array
			
		status_array << binary_status[1]				# get moviment status, add it to array
														# "0" = no moviment, "1" = is moving
		
		binary_status.slice!(0,2)						# removes power and moviment status

		status_array <<  binary_to_decimal(binary_status)	# get communication period, add it to array
		
		return status_array				# return an array [power, moviment, period]

	else
		return -1
	end
end

############################################################################
#
#		FUNCTIONS FOR DEAL WITH DATA TO MODULE
#
############################################################################

# receives three Fixnums and returns a String
def setStatus(error, power_mode, period_comm)
	##### First byte, cmd1
	# bit7 bit6 bit5 bit4 bit3 bit2 bit1 bit0
    # err   -    -   PWD   -    -    -    -
	##### Second byte, cmd2
	# bit7 bit6 bit5 bit4 bit3 bit2 bit1 bit0
    # PWD   -   PER5 PER4 PER3 PER2 PER1 PER0i

	# mount a string convering period to binary

	if (period_comm > 63 || period_comm < 1)
		return "Comm Period: max 63 minutes, min 1 minute"
	end

	if (error != 1 && error != 0)
		return "error must be 1(has error) or 0(no error)"
	end

	if (power_mode != 1 && power_mode != 0)
		return "power mode  must be 1(turn off module) or 0(turn on module)"
	end

	cmd1 = (error.to_s + "0" + "0" + power_mode.to_s).ljust(8, "0").to_s
	cmd2 = (power_mode.to_s + "0" + period_comm.to_s(2).rjust(6, "0")).to_s
	
	#puts cmd1 + "|" + binary_to_ascii(cmd1).to_s  + "|" + cmd2 + "|" +  binary_to_ascii(cmd2).to_s
	return binary_to_ascii(cmd1).to_s + binary_to_ascii(cmd2).to_s
	# setStatus(0,1,
	
end


