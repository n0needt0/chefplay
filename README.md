chefplay
========

#chef playground for opensource chef on Vagrant and VIrtual box

This project will install:

-- 11.0.8 opensource chef-server via Vagrant on ubuntu 12.04 vm

-- knfe and utilities on your workstation

-- Test Node, bring up and configure via Vagrant , bootstrap with knife and provision with Chef

#naming

HOST MACHINE - where chef-server and test node vms will run
chef-server - a VM 
test node - a VM
knife/workstation - usually my laptop that i use to manage chef nodes


#requirements

0. listen to some chef tutorials just to know what we are talking about
1. install virtualbox and vagrant. (you knew this already :)
2. git clone this repo to host machine.
3. to your workstation hosts file add "chefserver  IP OF HOST MACHINE"  entry
4. on your workstation run: 
  
    curl -O -L http://www.opscode.com/chef/install.sh

    sudo sh install.sh
    
5. on workstation set up where your chef stuff will be, (you can set up multiple)

    git clone https://github.com/opscode/chef-repo.git
  

#network layout

both chef-server and test node run on same machine,.

chef-server runs on port 8888 and port 8888 is only port forwarded to host machine.

test node is a ubuntu 12.04 image with ssh port 22 forwarded to port 2230 of a host machine


#configuration

For this test there is really nothing to confgure. Run as it is and then tweak as you know what buttons to push

#lets run

cd to chefserv


#boot strap your node

knife bootstrap -p 2230 -x vagrant -P vagrant --sudo YOUR_HOST_IP
