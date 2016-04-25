Note that of as late monday night I have managed to get continuous integration working - albeit a little flaky.
The issue is that I have generated so many different configurations that I can only guarantee changes to the GO app being reflected in the web pages. I could correct everything now that I finally have the continuous integration working but, to be honest, I'd probably start from the beginning again just to make everything look sensible.

Anyway, I have the local git repo, Jenkins and two servers configured in Oracle Virtualbox

Accessing http://94.193.240.168/ will produce the round-robin message as required.
Any changes to cookbooks/goapp/files/default/sainsb.go in the GITHUB will force Jenkins to reload the source, upload the Chef cookbooks and apply them to the relevant nodes.

I will ensure the address above is up and running between 09:00 and 17:00 each day this week.
Any issues then do please check this README in case SKY has changed my IP address.

chef-test
===============
A simple set of recipes to perform the following:

1) Install nginx on a web server.

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
