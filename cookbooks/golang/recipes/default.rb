#
# Cookbook Name:: testg
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "fetch_go_media" do
  command "cd /tmp; wget https://storage.googleapis.com/golang/go1.6.1.linux-amd64.tar.gz "
  not_if do ::File.exists?('/tmp/go1.6.1.linux-amd64.tar.gz.sainsb') end
end

execute "unzip_go_media" do
  command " tar -C /usr/local -xzf /tmp/go1.6.1.linux-amd64.tar.gz"
  only_if do ::File.exists?('/tmp/go1.6.1.linux-amd64.tar.gz') end
end

execute "clean_go_media" do
  command "mv /tmp/go1.6.1.linux-amd64.tar.gz /tmp/go1.6.1.linux-amd64.tar.gz.sainsb"
  only_if do ::File.exists?('/tmp/go1.6.1.linux-amd64.tar.gz') end
end

execute "configure_go_path" do
  command "echo export PATH=/usr/local/go/bin:$PATH >> ~/.bashrc"
end

execute "configure_work_path" do
  command "echo export GOPATH=/usr/local/go/workspace >> ~/.bashrc"
end

directory "/usr/local/go/workspace" do
  action :create
end

cookbook_file "/usr/local/go/workspace/sainsb.go" do
  source "sainsb.go"
  action :create
end

execute "daemonise" do
  command "nohup /usr/local/go/bin/go run /usr/local/go/workspace/sainsb.go &"
end
