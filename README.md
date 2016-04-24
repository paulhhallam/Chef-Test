chef-test
===============
A simple set of recipes to

1) Install nginx on a web server

2) Install GOALANG on two other servers.

3) Configure the web server and golang servers so that requests to the web server are balanced in a round-robin fashion to the 
two golang servers and these servers then present web pages identifying the host that serviced the request.

The web server host (NODE1) has the run list "install_nginx" and "goapp_nginx".

The golang servers (NODE3 and NODE4) have the run lists "install_golang" and "goapp".

To apply the cookbooks:

knife ssh -m "NODE1 NODE3 NODE4" 'sudo chef-client' --manual-list 

This assumes that:

1) The user is on the chef workstation.

2) Passwordless ssh between the workstation and the destination hosts is in place.

3) The destination hosts have chef-client configured.

4) The user on the destination hosts has passwordless sudo enabled.

5) The run lists for the nodes have been configured.
