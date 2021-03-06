require 'rails_helper'

feature 'reviewing' do
  before {Restaurant.create name: "Roast & Toast"}

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review Roast & Toast'
    fill_in "Thoughts", with: "Amazing!!!"
    select '5', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq ('/restaurants')
    expect(page).to have_content('Amazing!!!')
  end
end
