require 'client/gruff_web'

graph_data =  {"Fries" => [3,5,6,9],"Burgers" => [2,7,8,3], "Wings" => [4,3,9,11]}
graph_setup = {:data => graph_data, :theme => "37signals"}

File.open('bar.png','wb+'){|f|
 f.write RemoteGruff.graph(:bar, graph_setup)
}