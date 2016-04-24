#
# Cookbook Name:: nginx_goapp
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# Set up the nginx webserver to round robin balance all 
# requests to the go app servers 
#
# Replace the default ningx configuration file with
# our modified version
#
cookbook_file "/etc/nginx/conf.d/default.conf" do
  source "default.conf"
  action :create
end
#
# Substitute the values in the configuration file with the actual node names
#
node[:goapp].each do |ht, hn|
  execute "subs_nginx_nodes" do 
    command "sed -i 's/#{ht}/#{hn}/' /etc/nginx/conf.d/default.conf"
  end
end
#
# reload the nginx configuration
#
execute "reload_nginx" do
   command "nginx -s reload"
end

