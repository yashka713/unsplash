class PhotosController < ApplicationController
  require 'open-uri'

  def index
    page = params[:page] || 1
    @data = HTTParty.get("https://api.unsplash.com/search/photos?page=#{page}",
                         headers: {
                             Authorization: 'Client-ID e5d68f7e1de986324266773f832f6d473896eddf40090c5e594d9ae9374eff8a'
                         },
                         query: {query: "#{params[:q]}"})
    if @data == []
      flash[:notice] = 'Please, fill the blank below, with correct query:('
    else
      flash[:notice] = ''
    end
  end

  def show
    @data = HTTParty.get(ENV['GET_PHOTO'] + "/#{params[:format]}",
                         headers: {
                             Authorization: 'Client-ID e5d68f7e1de986324266773f832f6d473896eddf40090c5e594d9ae9374eff8a'
                         })
  end

  def download
    @data = HTTParty.get(ENV['GET_PHOTO'] + "/#{params[:format]}/download",
                         headers: {
                             Authorization: 'Client-ID e5d68f7e1de986324266773f832f6d473896eddf40090c5e594d9ae9374eff8a'
                         })
    url = @data['url']
    data = open(url).read
    send_data data, :disposition => 'attachment', :filename => "#{@data['url'].split('/').last}"
  end
end
