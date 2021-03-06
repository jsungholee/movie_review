require 'spec_helper'

describe 'User Page' do

  let(:user) { FactoryGirl.create(:user) }
  let!(:movie_like_1) {FactoryGirl.create(:movie_like, user: user) }
  let!(:movie_like_2) {FactoryGirl.create(:movie_like, user: user) }
  let!(:movie_like_3) {FactoryGirl.create(:movie_like, user: user) }
  let!(:review_like_1) {FactoryGirl.create(:review_like, user: user) }
  let!(:review_like_2) {FactoryGirl.create(:review_like, user: user) }
  let!(:review_like_3) {FactoryGirl.create(:review_like, user: user) }


	it 'displays a list of movies the user has liked.' do
		sign_in_as(user)
    visit user_path(user)
		expect(page).to have_content movie_like_1.movie.title
		expect(page).to have_content movie_like_2.movie.title
		expect(page).to have_content movie_like_3.movie.title
	end

	it "when I click on the liked movie's name, I should be sent to that movie's page." do
		sign_in_as(user)
    visit user_path(user)
    click_link movie_like_1.movie.title
    expect(page).to have_content("A cop turns to a mystical cat lady to convert into a ninja commando")
	end

	it 'displays a list of reviews the user has liked.' do
		sign_in_as(user)
		visit user_path(user)
		expect(page).to have_content review_like_1.review.body
		expect(page).to have_content review_like_2.review.body
		expect(page).to have_content review_like_3.review.body
	end

	it "when I click on the liked review's name, I should be sent to that review's page." do
		sign_in_as(user)
		visit user_path(user)
		click_link review_like_1.review.body
		expect(page).to have_content(review_like_1.review.body)
	end
end
