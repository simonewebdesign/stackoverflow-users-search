class MainController < ApplicationController
  def index
    # TODO move in config file
    url = "http://api.stackexchange.com/2.1/users?order=desc&sort=reputation&inname=simone&site=stackoverflow"
    request = Typhoeus::Request.new("http://simonewebdesign.it/blog/")
    request.run
    response = request.response
    puts response.inspect
    # @json = JSON.parse response.body
  end

  def about
  end

  def contact
  end
end
