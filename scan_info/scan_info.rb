# file open
# read one line
# extract channel num, pch info
# read one line
# read one line
# extract pid info, and broadcast name

raw_file = File.open("d:\\log\\channel_info.txt")

raw_file.each_line do |line|
	if (line =~ /^[0-9][0-9][0-9][0-9]/)
		ch_order = puts line.match('^[0-9][0-9][0-9][0-9]')
		puts ch_order
	end

	if (line =~ /v->..../)
		v_pid = line.match('v->....')
		puts v_pid
	end

	if (line =~ /a->..../)
		a_pid = line.match('a->....')
		puts a_pid
	end

	if (line =~ /pcr->..../)
		pcr_pid = line.match('pcr->....')
		puts pcr_pid
	end

	if (line =~ /ServiceName\s:\s/)
		service_name = line.match('ServiceName\s:\s.*')
		puts service_name
	end
end