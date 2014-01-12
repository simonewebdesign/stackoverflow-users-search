class MainController < ApplicationController
  def index
    # TODO move in config file
    # url = "https://api.stackexchange.com/2.1/users?order=desc&sort=reputation&inname=simone&site=stackoverflow"
    # request = Typhoeus::Request.new(
    #   url, 
    #   headers: { Accept: "application/json", accept_encoding: "gzip" }
    # )
    # request.run
    # response = request.response
    # gz = Zlib::GzipReader.new(StringIO.new(response.body))
    # json = JSON.parse gz.read, symbolize_names: true
    # # tentiamo di filtrare un po' i dati...
    # @users = json[:items]
  end

  def about
  end

  def contact
  end

  def search
    # TODO move in config file
    url = "https://api.stackexchange.com/2.1/users?order=desc&sort=reputation" +
          "&site=stackoverflow&inname=" + params[:user].to_s
    request = Typhoeus::Request.new(
      url, 
      headers: { Accept: "application/json", accept_encoding: "gzip" }
    )
    request.run
    response = request.response
    gz = Zlib::GzipReader.new(StringIO.new(response.body))
    json = JSON.parse gz.read, symbolize_names: true
    # tentiamo di filtrare un po' i dati...
    @users = json[:items] || []
    p @users
    render :index 
  end
end
