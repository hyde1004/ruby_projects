channel_file = File.open("d:\\log\\answer.txt")

channel_file.each_line do |line|
	service = Hash.new
	#puts line.match('[0-9]+')
	service[:order]	= line.match('[0-9]+')

	service[:v_pid] = line.match('0x')

end