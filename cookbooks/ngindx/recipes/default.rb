#
# Cookbook Name:: tests
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
cookbook_file "/etc/yum.repos.d/nginx.repo" do
  source "nginx.repo"
  mode "0644"
end

package "nginx" do
  package_name "nginx"
  action :install
end

directory "/usr/share/nginx/html/www" do
  action :create
end

directory "/usr/share/nginx/html/images" do
  action :create
end

cookbook_file "/etc/nginx/conf.d/default.conf" do
  source "default.conf"
  action :create
end

#cookbook_file "/usr/share/nginx/html/www/index.html" do
#  source "index.html"
#  mode "0644"
#end

service "nginx" do
  action [ :enable, :start ]
end


