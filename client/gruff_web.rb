require 'rubygems'
require 'httparty'

class RemoteGruff
  include HTTParty
  base_uri "http://localhost:4567/gruff"

  def self.graph(chart, opts)
    opts = default_options.merge({:query => opts})
    get("/#{chart}.png",opts)
  end

end
