require './lib/simulation'
require './lib/board'

def setup(args)
	args.each_with_index do |line, line_index|
		if line_index == 0
			@board = Board.new(line[0].to_i, line[2].to_i)
		end

		if line_index > 0 && line_index <= (@board.rows)
			@board.populate_row(line, line_index)
		end
	end
end

setup(ARGF)
print Simulation.new(@board.layout.transpose).board