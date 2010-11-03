require 'client/remote_gruff'

graph_data =  [["Fries", [3,5,6,9]],["Burgers", [2,7,8,3]], ["Wings", [4,3,9,11]]]
graph_setup = {:data => graph_data, :title => 'my line graph'}

RemoteGruff.write(:line, graph_setup, 'line.png')
