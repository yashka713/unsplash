class PhotosController < ApplicationController
  require 'open-uri'
  before_action :check_param_query, only: :index

  def index
    @data = HTTParty.get(ENV['SEARCH_URL'] + "?page=#{params[:page]}",
                         headers: {
                           Authorization: 'Client-ID 3e46d797b1b4e8887ff6c2c4fa3e07cd2995aa5003a1b92daffea94176f8f810'
                         },
                         query: { query: params[:q] })
    flash[:notice] = if params[:q] == ''
                       'Please, fill the blank below, with correct query'
                     end
  end

  def show
    @data = HTTParty.get(ENV['GET_PHOTO'] + "/#{params[:format]}",
                         headers: {
                           Authorization: 'Client-ID 3e46d797b1b4e8887ff6c2c4fa3e07cd2995aa5003a1b92daffea94176f8f810'
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

  private

  def check_param_query
    params[:page].to_i < 1 || params[:page].nil? ? params[:page] = 1 : params[:page]
  end
end
