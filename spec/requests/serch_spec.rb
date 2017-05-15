require 'spec_helper'
require 'rails_helper'

describe 'Request on index page' do
  it 'make get on "/" with query', :vcr do
    VCR.use_cassette('get_collection_of_photo') do
      visit root_path
      fill_in :q, with: 'car'
      click_button 'Search'
      expect(page.status_code).to eq 200
      expect(page).to have_selector('.likes-icon')
    end
  end
end
