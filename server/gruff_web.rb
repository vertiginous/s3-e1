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
  chart_type = CHARTS[ params[:chart] ]
  pass unless chart_type
  halt 500, 'you must include data points' unless params[:data]
  
  gruff = chart_type.new
  gruff.title = params[:title]
  gruff.send( "theme_#{params[:theme]}" ) if params[:theme]
  
  JSON.parse( params[:data] ).each do |name,points|
    gruff.data( name, points.map{|i| i.to_i } )
  end

  content_type :png
  gruff.to_blob
end
