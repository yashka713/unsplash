class PhotosController < ApplicationController
  require 'open-uri'

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
  end

  def download
    @data = HTTParty.get(ENV['GET_PHOTO'] + "/#{params[:format]}/download",
                 headers: {
                     Authorization: 'Client-ID 3e46d797b1b4e8887ff6c2c4fa3e07cd2995aa5003a1b92daffea94176f8f810'
                 })
    url = @data['url']
    data = open(url).read
    send_data data, :disposition => 'attachment', :filename=>"#{@data['url'].split('/').last}"
    # open("#{@data['url']}}") do |u|
    #   File.open("#{@data['url'].split('/').last}", 'wb') {|f| f.write(u.read)}
    #   flash[:notice] = 'File was successfully created'
    # end
    # redirect_to photos_show_path(params[:format])
  end

end
