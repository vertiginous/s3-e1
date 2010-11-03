require 'rubygems'
require 'sinatra'
require 'gruff'
require 'json'

CHARTS = {
   'bar'  => Gruff::Bar,
   'pie'  => Gruff::Pie,
   'line' => Gruff::Line
}

get '/gruff/:chart.png' do
  chart_type = params[:chart]
  gruff = CHARTS[chart_type].new
  params[:data].each{|name,points|
    points = points.map{|i| i.to_i }
    gruff.data(name,points)
  }
  gruff.title = params[:title] if params[:title]
  gruff.send( "theme_#{params[:theme]}" ) if params[:theme]
  content_type :png
  gruff.to_blob
end