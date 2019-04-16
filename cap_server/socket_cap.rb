#!/usr/bin/ruby

# http://www.tutorialspoint.com/ruby/ruby_socket_programming.htm

require 'socket'                # Get sockets from stdlib
require 'thread'

load 'functions_dwr.rb'
load 'record_data.rb'

mutex = Mutex.new


tcp_port = ARGV[0]

puts("Server is listenning on port #{tcp_port}")

server = TCPServer.open(tcp_port.to_i)   		# Socket to listen on port defined in command line
loop {                          				# Servers run forever
  Thread.fork(server.accept) do |client|
        #client.puts("0000000000000000")
        remote_data = client.gets
        #puts remote_data
		
		mutex.synchronize do
               result_code = record_info remote_data 
               client.puts(result_code)
		end
#		status = setStatus(0,0,60)
#		client.puts(status)
#		puts("Sent status: #{status}")
		record_log remote_data
		#printsomething
    client.close                				# Disconnect from the client
  end
}

