The files ambari1-3 and ambari1-4 are images created by the windows snipping tool of two consecutive requests for http://ambari1 which are serviced by the nodes ambari3 and ambari4.

To configure the environment:

1) Extract the zip file to your chef-repo directory on the chef workstation.
   This will restore the cookbooks directory containing the ngindx and golab directories.

2) We assume that three nodes have been built with Red Hat 7 and chef client. NODE1, NODE2 and NODE3.

3) A user has been configured on all 3 nodes with:
   A) Member of the wheel group (allows teh uise of SUDO to run all commands.
   B) /etc/sudoers is set up so that no passwords are required for the wheel group.
   C) Passwordless ssh is set up for the user between the chef workstation and the nodes 

4) Chef workstation, server and clients have all beeen configured.

5) All nodes have been registered with the Chef server.

6) Add the recipe ngindx to the run list for NODE1
	$ knife node run_list set NODE1 'recipe[ngindx]'

7) Add the recipe golang to the run list for NODE2
	$ knife node run_list set NODE2 'recipe[golang]'

8) Add the recipe golang to the run list for NODE3
	$ knife node run_list set NODE3 'recipe[golang]'

9) Edit the file "cookbooks/ngindx/file/default/default.conf" and change the node names 
NODE1, NODE2, NODE3 to whatever the real node names are.

10) Apply the recipes:
knife ssh -m "NODE1 NODE2 NODE3" 'sudo chef-client' --manual-list --ssh-user AUSER 
