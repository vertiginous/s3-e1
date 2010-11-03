require 'client/gruff_web'

graph_data =  {"Fries" => 12,"Burgers" => 12, "Wings" => 27}
graph_setup = {:data => graph_data, :title => 'my pie graph', :theme => "odeo"}

File.open('pie.png','wb+'){|f|
 f.write RemoteGruff.graph(:pie, graph_setup)
}