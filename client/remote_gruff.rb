require 'rubygems'
require 'httparty'
require 'json'

module RemoteGruff
  include HTTParty
  base_uri "http://localhost:4567/gruff"

  def self.graph(chart, opts)
    opts[:data] = opts[:data].to_json
    opts = default_options.merge({:query => opts})
    get("/#{chart}.png",opts)
  end

  def self.write(chart, opts, file)
    File.open(file,'wb'){|f|
      f.write RemoteGruff.graph(chart, opts)
    }
  end
end
