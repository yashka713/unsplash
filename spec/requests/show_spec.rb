require 'spec_helper'
require 'rails_helper'

describe 'Request on show page' do
  it 'make get on "/show"', :vcr do
    VCR.use_cassette('get_collection_of_photo') do
      visit root_path
      fill_in :q, with: 'car'
      click_button 'Search'
    end
    VCR.use_cassette('get_photo') do
      page.find(:xpath, "//a[@href='/photos/show.sVe4lUSZh70']").click
      expect(page.status_code).to eq 200
      expect(page).to have_content('rozetsky')
    end
  end
end
