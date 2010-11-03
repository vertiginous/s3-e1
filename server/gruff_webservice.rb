require 'rubygems'
require 'sinatra'
require 'gruff'

def get_method(meth, gruff)
  meth = meth.gsub(/\d$/, '')
  gruff.respond_to?("#{meth}=") ? "#{meth}=" : meth
end

def parse(values)
  t,v = values.scan(/(\w+)\[([\d\|]*)\]/).first
  v ? [t,v.split('|').map{|n| n.to_i} ] : [values]
end

def create_graph(params)
  chart_type = params.delete('chart').capitalize
  chart = Gruff.const_get(chart_type).new
  params.each{|meth,values|
    meth   = get_method(meth, chart)
    if values
      values = parse(values)
      chart.send(meth,*values)
    else
      chart.send(meth)
    end
  }
  chart
end

get '/gruff/:chart.png' do
  content_type :png
  create_graph(params).to_blob
end