class Simulation
	def count_fallables(column)
		column.count(".") + (column.count(":") * 2)
	end

	def provide_sorted(fallable_count, length)
		sorted = []
		pending_fallables = fallable_count

		while pending_fallables > 0
			if pending_fallables >= 2
				sorted.push(":")
				pending_fallables = pending_fallables - 2
			else
				sorted.push(".")
				pending_fallables = pending_fallables - 1
			end
		end

		until sorted.length == length
			sorted.push(" ")
		end

		sorted.reverse
	end

	def sort_column(column)
		if column.include?("T")
			sorted_column = []
			pivot = column.index("T")
			front = column[0...pivot]
			back = column[pivot+1..-1]

			sorted_column.push(provide_sorted(count_fallables(front), front.length))
			sorted_column.push(["T"])
			sorted_column.push(provide_sorted(count_fallables(back), back.length))
			sorted_column.flatten
		else
			provide_sorted(count_fallables(column), column.length)
		end
	end
end