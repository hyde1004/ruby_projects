# DIR_PATH = '\/Volumes\/Data\/hyde1004\/Downloads\/little\ fox' it doesn't work. why?

# sort by modification time
files_sorted_by_time = Dir['*.mp3'].sort_by{ |f| File.mtime(f) }

# change file name by order
index = 1
files_sorted_by_time.each do | mp3_file |

	new_mp3_file =  "#{sprintf("%02d", index)}_#{mp3_file}"
	 puts new_mp3_file
	#File.rename(mp3_file, new_mp3_file)
	index = index+1
end