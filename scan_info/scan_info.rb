# file open
# read one line
# extract channel num, pch info
# read one line
# read one line
# extract pid info, and broadcast name

list = Array.new

raw_file = File.open("d:\\log\\channel_info.txt")

until raw_file.eof

	service = Hash.new

	line = raw_file.readline
	
	# if (line == nil) 
	# 	break
	# end

	if (line =~ /^[0-9][0-9][0-9][0-9]/)
		ch_order = line.match('^[0-9][0-9][0-9][0-9]')
		#puts ch_order
		service[:order] = ch_order.to_s
	end

	line = raw_file.readline

	line = raw_file.readline
	if (line =~ /v->..../)
		v_pid = line.match('v->....')
		#puts v_pid
		service[:v_pid] = v_pid.to_s
	end

	if (line =~ /a->..../)
		a_pid = line.match('a->....')
		#puts a_pid
		service[:a_pid] = a_pid.to_s
	end

	if (line =~ /pcr->..../)
		pcr_pid = line.match('pcr->....')
		#puts pcr_pid
		service[:pcr_pid] = pcr_pid.to_s
	end

	if (line =~ /ServiceName\s:\s/)
		service_name = line.match('ServiceName\s:\s.*')
		#puts service_name
		service[:service_name] = service_name.to_s
	end

	list.push(service);
end
puts "total channels : #{list.size}"

for service in list
	puts service
end
#puts raw_file.readline

=begin
count = 0
raw_file.each_line do |line|
	service = Hash.new

	if (line =~ /^[0-9][0-9][0-9][0-9]/)
		ch_order = line.match('^[0-9][0-9][0-9][0-9]')
		#puts ch_order
		service[:order] = ch_order.to_s
	end

	if (line =~ /v->..../)
		v_pid = line.match('v->....')
		#puts v_pid
		service[:v_pid] = v_pid.to_s
	end

	if (line =~ /a->..../)
		a_pid = line.match('a->....')
		#puts a_pid
		service[:a_pid] = a_pid.to_s
	end

	if (line =~ /pcr->..../)
		pcr_pid = line.match('pcr->....')
		#puts pcr_pid
		service[:pcr_pid] = pcr_pid.to_s
	end

	if (line =~ /ServiceName\s:\s/)
		service_name = line.match('ServiceName\s:\s.*')
		#puts service_name
		service[:service_name] = service_name.to_s
	end

	count = count + 1
	if (count % 3 == 0)
		puts "#{count/3} #{service}"
	end
end
=end


