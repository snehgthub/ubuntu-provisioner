# Script to be used to provision my Ubuntu server
#!/bin/bash

echo "export DEBIAN_FRONTEND=noninteractive" >> .bashrc
source .bashrc

# Defining a function which updates and installs required packages
function install_reqd_packages(){

   # Updating and upgrading packages
	apt update
	apt upgrade -y

   # Installing vim-nox if it does not exist
	if ! command -v vim.nox > /dev/null
	then
		apt install vim-nox -y
	fi

   # Installing other required packages from reqd-packages.txt
  	for package in $(ls reqd-packages.txt)
	do
		apt install -y $package
	done
}

# Calling the function install_reqd_packages
install_reqd_packages

# Setting vim-nox the default editor for System
update-alternatives --set editor $(which vim.nox)
