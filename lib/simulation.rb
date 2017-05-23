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

	def handle_t(array)
		sorted_array = []

		while array.index("T") != nil
			segment = array[0...array.index("T")]
			sorted_array.push(provide_sorted(count_fallables(segment), segment.length))
			sorted_array.push(["T"])
			array = array[array.index("T")+1..-1]
		end

		sorted_array.push(provide_sorted(count_fallables(array), array.length))
		sorted_array.flatten
	end

	def sort_column(column)
		if column.include?("T")
			handle_t(column)
		else
			provide_sorted(count_fallables(column), column.length)
		end
	end
end