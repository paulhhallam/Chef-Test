# goapp_nginx Cookbook

This cookbook will reconfigure the nginx web serevr to redirect all http requests to two satellite nodes on port 8484 in a round robin fashion.
The process will:
Replace the nginx default.conf file with one having placeholders for the node names. 
Modify the valuies in the default.conf file with the three hosts identified in the attributes.
Reload the nginx service.

## Requirements

nginx installed.

## Attributes

default[:goapp] = {'wserver' => "ambari1", 'rrobin1' => "ambari3", 'rrobin2' => "ambari4"}

Where 
"wserver" identifies the host acting as the web server. ## Just realised I should have got the host name locally but I've left it too late to change it right now. Maybe Monday morning.
"rrobin1"  identifies the host acting as the first go aplication server in the round robin list.
"rrobin2"  identifies the host acting as the second go aplication server in the round robin list.

### goapp_nginx::default

Just include `goapp_nginx` in the node `run_list`:

## License and Authors

Authors: Paul Hallam

