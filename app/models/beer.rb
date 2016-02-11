class Beer < ActiveRecord::Base
	include AverageRating

	validates :name, presence: true
	validates :style, presence: true

	belongs_to :brewery
	has_many :ratings, dependent: :destroy
	has_many :raters, through: :ratings, source: :user

	def to_s

		return "#{brewery.name}, #{name}"
	end
end
