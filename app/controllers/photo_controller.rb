class PhotoController < ApplicationController

  def index
    @data = HTTParty.get(ENV['SEARCH_URL'],
                         headers: {
                             Authorization: 'Client-ID 3e46d797b1b4e8887ff6c2c4fa3e07cd2995aa5003a1b92daffea94176f8f810'
                         },
                         query: {query: "#{params[:q]}"})
    @data = JSON.parse(@data.body)['results']
    if @data == []
      flash[:notice] = 'Please, fill the blank below, with correct query:('
    else
      flash[:notice] = ''
    end
  end

  def show
    @data = HTTParty.get(ENV['GET_PHOTO'] + "/#{params[:format]}",
                         headers: {
                             Authorization: 'Client-ID 3e46d797b1b4e8887ff6c2c4fa3e07cd2995aa5003a1b92daffea94176f8f810'
                         })
    @data = JSON.parse(@data.body)
    # debugger
  end

  # def my_request(param, adress)
  #   HTTParty.get(adress,
  #                headers: {
  #                    Authorization: 'Client-ID 3e46d797b1b4e8887ff6c2c4fa3e07cd2995aa5003a1b92daffea94176f8f810'
  #                },
  #                query: {query: "#{param}"})
  # end

end
