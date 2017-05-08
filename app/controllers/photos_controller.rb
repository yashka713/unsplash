class PhotosController < ApplicationController
  require 'open-uri'

  def index
    page = params[:page] || 1
    @data = HTTParty.get(ENV['SEARCH_URL'] + "?page=#{page}",
                         headers: {
                           Authorization: ENV['FIRST_ID']
                         },
                         query: { query: params[:q].to_s })
    flash[:notice] = if @data['results'] == []
                       'Please, fill the blank below, with correct query'
                     end
  end

  def show
    @data = HTTParty.get(ENV['GET_PHOTO'] + "/#{params[:format]}",
                         headers: {
                           Authorization: ENV['FIRST_ID']
                         })
  end

  def download
    @data = HTTParty.get(ENV['GET_PHOTO'] + "/#{params[:format]}/download",
                         headers: {
                           Authorization: ENV['FIRST_ID']
                         })
    url = @data['url']
    data = open(url).read
    send_data data, disposition: 'attachment', filename: params[:format]
  end
end
