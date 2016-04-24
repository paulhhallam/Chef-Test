This is a simple cookbook to install the nginx web server on any RED HAT 7 host.

# install_nginx Cookbook

This cookbook installs and starts the web server nginx. 

1) The yum repo config file is created if necessary

2) nginx is unstalled using yum

3) The nginx www and images directories are created.

5) The nginx service is enabled and started.


## Requirements

### install_nginx::default

Just include `install_nginx` in any relevant node's `run_list`:

## License and Authors

Authors: Paul Hallam

