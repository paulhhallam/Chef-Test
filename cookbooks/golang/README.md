# golang

Please note as this is a simple test I have defaulted to using the root account.

This recipe will:

1) Download golang if the zip file does not already exist in /tmp

2) Unzip to /usr/local/go if the zip file has been downloaded

3) Rename the zip file to ensure it is not downloaded next time the recipe is run.

3) Add /usr/local/go/bin to the PATH setting in /root/bashrc

4) Create the workspace /usr/local/go/workspace

5) Place the file "sainsb.go" in /usr/local/go/workspace

6) As root nohup the sainsb.go file

All http requests to port 8484 on this host will respon with:
"Hi there, I'm served from <nodename>"

N.B. Further work would be to:
1) configure the environment variables for user wide access.
2) set the go execution as a service.
