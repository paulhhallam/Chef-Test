#
# Cookbook Name:: goapp
# Recipe:: default
#
# Insert the GO app into the workspace
#
cookbook_file "/usr/local/go/workspace/sainsb.go" do
  source "sainsb.go"
  mode '0755'
  action :create
end
#
# Create the service configuration file for the GO app
#
cookbook_file "/etc/systemd/system/goapp.service" do
  source "goapp.service"
  action :create
end
#
# start the go app as a service and set it to restart
#
service "goapp" do
  action [ :enable, :start ]
end
