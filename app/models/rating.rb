class Rating < ActiveRecord::Base
	belongs_to :beer
	belongs_to :user

	def to_s


		return "#{beer.name} score: #{score}"

	end
end