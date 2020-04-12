require 'net/http'
require 'uri'
require 'json'

#Parse Toppings
class ToppingParser
  attr_accessor :uri

  def initialize(uri)
    @uri = uri
  end

  def parse(uri)
    URI.parse(uri)
  end

  def get_response(uri)
    Net::HTTP.get_response(uri)
  end

  def get_data(response)
    JSON.parse(response.body)
  end
end
