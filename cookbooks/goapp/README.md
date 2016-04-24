# goapp

This cookbook will place the GO app file sainsb.go in the defult GO workspace as created by the install_goapp cookbook.
A service will be created to run the go app.
The go app service will be enabled and started.

# Prerequisites

Th cookbook install_goapp must have been run

# go app
When accessed on port 8484 this app will present a web page displaying the host name.

