class MainController < ApplicationController
  def index
    # TODO move in config file
    url = "http://api.stackexchange.com/2.1/users"
    request = Typhoeus::Request.new(
      url, 
      headers: { Accept: "application/json", accept_encoding: "gzip" }
    )
    request.run
    response = request.response
    p "RESPONSE HEADERS"
    p response.headers_hash
    # @json = JSON.parse response.body
    p "BODY"
    p response.body
    gz = Zlib::GzipReader.new(StringIO.new(response.body))    
    @json = gz.read
  end

  def about
  end

  def contact
  end
end
