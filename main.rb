def store_dimensions(columns, rows) 
	@columns = columns
	@rows = rows
end

def create_board(columns, rows)
	@board = Array.new(rows){Array.new(columns)}
end

def populate_row(input, input_index)
	input.split("").each_with_index do |char, char_index|
		if char_index <= (@columns - 1)
			@board[input_index-1][char_index] = char
		end
	end
end

def setup(args)
	args.each_with_index do |line, line_index|
		if line_index == 0
			store_dimensions(line[0].to_i, line[2].to_i)
			create_board(@columns, @rows)
		end

		if line_index > 0 && line_index <= (@rows)
			populate_row(line, line_index)
		end
	end
end

setup(ARGF)
print @board