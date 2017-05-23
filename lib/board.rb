class Board
	attr_reader :columns, :rows, :layout

	def initialize(columns, rows)
		@board = self.create(columns, rows)
	end

	def create(columns, rows)
		@columns = columns
		@rows = rows
		@layout = Array.new(rows){Array.new(columns)}
	end

	def populate_row(input, input_index)
		input.split("").each_with_index do |char, char_index|
			if char_index <= (self.columns - 1)
				@board[input_index-1][char_index] = char
			end
		end
	end
end