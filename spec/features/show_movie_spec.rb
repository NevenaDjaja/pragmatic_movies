require 'rails_helper'

describe "Viewing an individual movie" do
	it "should show the movie" do 
		movie = Movie.create(movie_attributes)
		visit movie_url(movie.id)

		expect(page).to have_text(movie.title)
	end

	it "should show the total gross if it exceeds $50 million" do
		movie = Movie.create(movie_attributes(total_gross: 60000000.00))
		visit movie_url(movie.id)

		expect(page).to have_text("$60,000,000.00")
	end

	it "should show 'Flop! when total gross is less than $50 million" do 
		movie = Movie.create(movie_attributes(total_gross: 40000000.00))
		visit movie_url(movie.id)

		expect(page).to have_text('FLOP!')
	end
end