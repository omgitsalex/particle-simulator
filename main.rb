ARGF.each_with_index do |line, line_index|
	if line_index == 0
		@columns = line[0].to_i
		@rows = line[2].to_i
		@board = Array.new(@rows){Array.new(@columns)}
	end

	if line_index > 0 && line_index <= (@rows)
		line.split("").each_with_index do |char, char_index|
			if char_index <= (@columns - 1)
				@board[line_index-1][char_index] = char
			end
		end
	end
end

print @board