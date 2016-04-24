#
# Cookbook Name:: goapp
# Recipe:: default
#
#
# Get the current version of GO if it is installed
#
ruby_block "test_go_version" do
  only_if { ::File.exists?("/usr/local/go/bin/go") }
    block do
      lines = %x(/usr/local/go/bin/go version)
      lines.chop
      node.set[:govn][:govnv] = lines.chop
    end
end
#
# Exit the installation if GO is already installed
#
return if node.normal[:govn][:govnv] == node.default[:govn][:govers]
#
#  Get the golang install file
#
execute "fetch_go_media" do
  command "cd /tmp; wget https://storage.googleapis.com/golang/go1.6.1.linux-amd64.tar.gz "
end
#
# unzip the gz file to the default golang installation directory /usr/local
#
execute "unzip_go_media" do
  command " tar -C /usr/local -xzf /tmp/go1.6.1.linux-amd64.tar.gz"
end
#
# remove the zip file.
#
execute "clean_go_media" do
  command "rm /tmp/go1.6.1.linux-amd64.tar.gz"
end
#
# Configure the environment variables
#
cookbook_file "/etc/profile.d/golang.csh" do
  source "golang.csh"
  mode '0755'
  action :create
end
cookbook_file "/etc/profile.d/golang.sh" do
  source "golang.sh"
  mode '0755'
  action :create
end
#
# create the workspace to put the GO app into
#
directory "/usr/local/go/workspace" do
  action :create
end

