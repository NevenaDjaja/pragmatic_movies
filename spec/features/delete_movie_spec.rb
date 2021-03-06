require 'rails_helper'

describe 'Deleting a movie' do 
	it 'destroys the movie and shows the movie listing' do
		movie = Movie.create(movie_attributes)

		visit movie_path(movie)
		expect(page).to have_text 'Delete'

		click_link 'Delete'
		expect(current_path).to eq(movies_path)
		expect(page).not_to have_text(movie.title)
	end

end