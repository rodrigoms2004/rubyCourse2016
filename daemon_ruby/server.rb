class Server
	
	attr_reader :options, :quit

	def initialize(options)

		@options = options
		
		# daemonization will change CWD so expand relative paths now
		options[:logfile] = File.expand_path(logfile) if logfile?
		options[:pidfile] = File.expand_path(pidfile) if pidfile?

	end

	def daemonize?
		options[:daemonize]
	end

	def logfile
		options[:logfile]
	end

	def pidfile
		options[:pidfile]
	end

	def logfile?
		!logfile.nil?
	end

	def pidfile?
		!pidfile.nil?
	end

	def write_pid
		if pidfile?
    		begin
      			File.open(pidfile, ::File::CREAT | ::File::EXCL | ::File::WRONLY){|f| f.write("#{Process.pid}") }
      			at_exit { File.delete(pidfile) if File.exists?(pidfile) }
    		rescue Errno::EEXIST
      			check_pid
      			retry
    		end
  		end
	end

	def check_pid
		if pidfile?
			case pid_status(pidfile)
			when :running, :not_owned
				puts "A server is already running. Check #{pidfile}"
      			exit(1)
			when :dead
				File.delete(pidfile)
			end		
		end
	end

	def pid_status(pidfile)
		return :exited unless File.exists?(pidfile)
		pid = ::File.read(pidfile).to_i
		return :ddead if pid == 0
		Process.kill(0, pid)		#	check process status
		:running
	rescue Errno::ESRCH
		:dead
	rescue Errno::EPERM
		:not_owned
	end

	def daemonize
		exit if fork
		Process.setsid
		exit if fork
		Dir.chdir "/"
	end

	def redirect_output
		FileUtils.mkdir_p(File.dirname(logfile), :mode => 0755)
		FileUtils.touch logfile
		File.chmod(0644, logfile)
		$stderr.reopen(logfile, 'a')
		$stdout.reopen($stderr)
		$stdout.sync = $stderr.sync = true
	end
	
	def suppress_output
		$stderr.reopen('/dev/null', 'a')
		$stdout.reopen($stderr)	
	end

	def trap_signals
		trap(:QUIT) do 	# graceful shutdown of run
			@quit = true
		end
	end

	def run!

		check_pid
		daemonize if daemonize?
		write_pid
		trap_signals
	
		if logfile?
			redirect_output
		elsif daemonize?
			suppress_output
		end

		while !quit
			puts "Doing some work"
			sleep(2)
		end
	end	

end
