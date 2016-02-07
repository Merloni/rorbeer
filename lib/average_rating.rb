module AverageRating
	def average_rating

		return 0 if ratings.empty?

		return ratings.average(:score).round(1)

	end


end