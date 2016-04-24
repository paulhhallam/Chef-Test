#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# Install nginx 
#
# If it doesn't already exist create the package 
# repository configuration file
#
cookbook_file "/etc/yum.repos.d/nginx.repo" do
  source "nginx.repo"
  mode "0644"
end
#
# Install nginx if not already installed 
#
package "nginx" do
  package_name "nginx"
  action :install
end
#
#create the standard nginx www directory
#
directory "/usr/share/nginx/html/www" do
  action :create
end
#
#
#create the standard nginx images directory
#
directory "/usr/share/nginx/html/images" do
  action :create
end
#
# start the nginx service and set it to restart
#
service "nginx" do
  action [ :enable, :start ]
end


