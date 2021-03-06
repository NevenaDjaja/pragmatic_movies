class Movie < ActiveRecord::Base

	RATINGS = %w(G PG PG-13 R NC-17)

	validates :title, :released_on, :duration, presence: true

	validates :description, length: { minimum: 25 }

	validates :total_gross, numericality: { greater_than_or_equal_to: 0}

	validates :image_file_name, allow_blank: true, format: {
		with: /\w+\.(gif|jpg|png)\z/i,
		message: 'must reference a GIF, JPG or PNG'
	}

	validates :rating, inclusion: { in: RATINGS, message: "must be a valid rating"}

	def flop?
		total_gross.blank? || total_gross < 50000000
	end

	def self.released
		where("released_on <= ?", Time.now).order("released_on desc")
	end
end
