class PhotoController < ApplicationController

  def index
    @response = HTTParty.get(ENV['SEARCH_URL'], query: 'World')
  end
end
