require 'client/remote_gruff'

graph_data =  [["Fries", [12]],["Burgers", [12]], ["Wings", [27]]]
graph_setup = {:data => graph_data, :title => 'my pie graph', :theme => "odeo"}

RemoteGruff.write(:pie, graph_setup, 'pie.png')
