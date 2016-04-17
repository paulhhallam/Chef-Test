# ngindx Cookbook

This cookbook installs and starts the web server nginx.
This webserver will round robin balance all requests to ambari1 to ambari3 and ambari4

To change the hostnames edit the file ngindx/files/default/default.conf

1) The yum repo config file is created if necessary

2) nginx is unstalled using yum 

3) The nginx www and images directories are created.

4) The nginx defult.conf file is replaced.

5) The nginx service is enabled and started.

