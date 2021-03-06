require 'spec_helper'

describe Simulation do
	before :each do 
		@simulation = Simulation.new([])
	end

	describe("#count_fallables") do
		it "returns the correct count when given a single ." do
			expect(@simulation.count_fallables(["."])).to eql 1
		end

		it "returns the correct count when given a single :" do
			expect(@simulation.count_fallables([":"])).to eql 2
		end

		it "returns the correct count when given multiple .s" do
			expect(@simulation.count_fallables([".", ".", "."])).to eql 3
		end

		it "returns the correct count when given multiple :s" do
			expect(@simulation.count_fallables([":", ":", ":"])).to eql 6
		end

		it "returns the correct count when given a mixture" do
			expect(@simulation.count_fallables([":", ":", "."])).to eql 5
		end
	end

	describe("#provide_sorted") do
		it "returns a correctly sorted array when given 1 fallable" do
			expect(@simulation.provide_sorted(1, 5)).to eql [" ", " ", " ", " ", "."]
		end

		it "returns a correctly sorted array when given 2 fallables" do
			expect(@simulation.provide_sorted(2, 5)).to eql [" ", " ", " ", " ", ":"]
		end

		it "returns a correctly sorted array when given 3 fallables" do
			expect(@simulation.provide_sorted(3, 5)).to eql [" ", " ", " ", ".", ":"]
		end

		it "returns a correctly sorted array when given 8 fallables" do
			expect(@simulation.provide_sorted(8, 5)).to eql [" ", ":", ":", ":", ":"]
		end
	end

	describe("#sort_column") do 
		it "returns a correctly sorted column when given a column with 1 fallable" do 
			expect(@simulation.sort_column([" ", ".", " ", " ", " "])).to eql [" ", " ", " ", " ", "."]
		end

		it "returns a correctly sorted column when given a column with 5 fallables" do 
			expect(@simulation.sort_column([":", ".", ":", " ", " "])).to eql [" ", " ", ".", ":", ":"]
		end

		it "respects 1 T" do
			expect(@simulation.sort_column([":", " ", "T", ".", " "])).to eql [" ", ":", "T", " ", "."]
		end

		it "respects multiple Ts" do
			expect(@simulation.sort_column([":", " ", "T", ".", " ", "T", ":", " "])).to eql [" ", ":", "T", " ", ".", "T", " ", ":"]
		end

		it "respects an arbitrary number of multiple Ts" do
			expect(@simulation.sort_column([":", " ", "T", ".", " ", "T", ":", " ", ":", " ", "T", ".", " ", "T", ":", " "])).to eql [" ", ":", "T", " ", ".", "T", " ", " ", ":", ":", "T", " ", ".", "T", " ", ":"]
		end
	end

	describe("#sort_columns") do
		before :each do 
			@columns = [[".", ".", " ", " "], [".", "T", " ", " "], [".", " ", "T", " "], [":", ".", " ", " "], [":", ":", ":", ":"]]
			@solution = [[" ", " ", " ", ":"], [".", "T", " ", " "], [" ", ".", "T", " "], [" ", " ", ".", ":"], [":", ":", ":", ":"]]
		end
		
		it "returns sorted columns" do
			expect(@simulation.sort_columns(@columns)).to eql @solution
		end
	end 
end