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
end