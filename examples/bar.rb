require 'client/remote_gruff'

graph_data =  [["Fries", [3,5,6,9]],["Burgers", [2,7,8,3]], ["Wings", [4,3,9,11]]]
graph_setup = {:data => graph_data, :theme => "37signals"}

RemoteGruff.write(:bar, graph_setup, 'bar.png')
