This is a simple cookbook to install the GOLANG software on a Red Hat 7 system.

This recipe will:

1) Download golang if the software has not been loaded.

2) Unzip to /usr/local/go and removethe zip file

3) Add /usr/local/go/bin to all user deault user PATH settings

4) Create the workspace /usr/local/go/workspace

## Attributes

## Usage

Include `install_golang` in the relevant nodes `run_list`:

## License and Authors

Authors: Paul Hallam

