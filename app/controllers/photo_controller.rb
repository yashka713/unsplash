class PhotoController < ApplicationController

  def index
    @data = HTTParty.get(ENV['SEARCH_URL'],
                         headers: {
                             Authorization: 'Client-ID 3e46d797b1b4e8887ff6c2c4fa3e07cd2995aa5003a1b92daffea94176f8f810'
                         },
                         query: {query: "#{params[:q]}"})
    @data = JSON.parse(@data.body)['results']
    if @data == []
      flash[:notice] = 'Please, fill the blank below :('
    else
      flash[:notice] = ''
    end
  end

  def show
    render 'show'
    @data = HTTParty.get(ENV['GET_PHOTO'],
                         headers: {
                             Authorization: 'Client-ID 3e46d797b1b4e8887ff6c2c4fa3e07cd2995aa5003a1b92daffea94176f8f810',
                             id: "#{params[:id]}"
                         },
                         query: {})
    @data = JSON.parse(@data.body)
  end

  # def my_request(param, adress)
  #   HTTParty.get(adress,
  #                headers: {
  #                    Authorization: 'Client-ID 3e46d797b1b4e8887ff6c2c4fa3e07cd2995aa5003a1b92daffea94176f8f810'
  #                },
  #                query: {query: "#{param}"})
  # end

end
