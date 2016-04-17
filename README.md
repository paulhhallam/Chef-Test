1) Extract the zip file to your chef-repo directory on the chef workstation.
   This will restore the cookbooks directory containing the ngindx and golab directories.

1) Three nodes have been built with Red Hat 7 and chef client. NODE1, NODE2 and NODE3.

2) A user has been configured on all 3 nodes with:
   A) Member of the wheel group (allows teh uise of SUDO to run all commands.
   B) /etc/sudoers is set up so that no passwords are required for the wheel group.
   C) Passwordless ssh is set up for the user between the chef workstation and the nodes 

2) Chef workstation, server and clients have all beeen configured.

3) All nodes have been registered with the Chef server.

4) Add the recipe ngindx to the run list for NODE1
	$ knife node run_list set NODE1 'recipe[ngindx]'

5) Add the recipe golang to the run list for NODE2
	$ knife node run_list set NODE2 'recipe[golang]'

6) Add the recipe golang to the run list for NODE3
	$ knife node run_list set NODE3 'recipe[golang]'

7) Edit the file "cookbooks/ngindx/file/default/default.conf" and change the node names 
NODE1, NODE2, NODE3 to whatever the real node names are.

8) Apply the recipes:
knife ssh -m "NODE1 NODE2 NODE3" 'sudo chef-client' --manual-list --ssh-user AUSER 
