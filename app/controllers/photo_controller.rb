class PhotoController < ApplicationController

  def index
    @data = my_request (params[:q])
  end

  def show
    # @data =
  end

  def my_request(param)
    HTTParty.get('https://api.unsplash.com/search/photos',
                 headers: {
                     Authorization: 'Client-ID 3e46d797b1b4e8887ff6c2c4fa3e07cd2995aa5003a1b92daffea94176f8f810'
                 },
                 query: {query: "#{param}"})
  end

end
