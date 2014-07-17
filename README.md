Author: Andrew Yasinsky

Disclaimer!!!!

no kittens were harmed!

ideas were liberated from [here]  (http://thornelabs.net/2013/09/16/install-the-open-source-chef-server-setup-knife-on-your-workstationand-bootstrap-your-first-client-server.html)

chefplay
========

Want to play with chef... here go :)

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
  
#security

For this install i disable https on chef server. to enable see chefplay/chefserv/bootstrap.sh

#network layout

both chef-server and test node run on same machine,.

chef-server runs on port 8888 and port 8888 is only port forwarded to host machine.

test node is a ubuntu 12.04 image with ssh port 22 forwarded to port 2230 of a host machine


#configuration

For this test there is really nothing to confgure. Run as it is and then tweak as you know what buttons to push

#start chef server

cd to chefplay/chefserv

vagrant up


this will install chef server (check it is there from your workstation http://chefserver:8888)

#start test node

cd chefplay/chefserv

vagrant up


#configure stuff

navigate to http://chefserver:8888, login as the admin user (the default password is shown on a right), and change the default admin password.

Next, regenerate the chef-validator Private Key by going to Clients > chef-validator > Edit, check the Regenerate Private Key box, and click Save Client. Copy the new Private Key to xxxx/chef-repo/.chef/chef-validator.pem on your workstation.

Create a new user on Chef Server by going to Users > Create, check the Admin box, fill out the necessary fields example testuser, and click Create User. Copy the Private Key to xxxx/chef-repo/.chef/testuser.pem

open terminal run 'knife configure'. Fill out the fields, do not accept defaults set your own.

here is my test user run:

```
WARNING: No knife configuration file found
Where should I put the config file? [/home/testuser/.chef/knife.rb] /home/testuser/chef-repo/.chef/knife.rb
Please enter the chef server URL: [https://localhost:443] http://chefserver:8888
Please enter an existing username or clientname for the API: [testuser] 
Please enter the validation clientname: [chef-validator] 
Please enter the location of the validation key: [/etc/chef-server/chef-validator.pem] /home/testuser/chef-repo/.chef/chef-validator.pem
Please enter the path to a chef repository (or leave blank): /home/testuser/chef-repo

You must place your client key in:
  /home/testuser/chef-repo/.chef/testuser.pem
Before running commands with Knife!

You must place your validation key in:
  /home/testuser/chef-repo/.chef/chef-validator.pem
Before generating instance data with Knife!

Configuration file written to /home/testuser/chef-repo/.chef/knife.rb
```

#test installation

from your workstation go to chef-repo directory. and run

**knife client list** or **knife node list** to see lists of your registered clients and nodes, respectively.


#boot strap your node

this where fun starts

from workstation chef-repo directory run:

knife bootstrap -p 2230 -x vagrant -P vagrant --sudo HOST-MACHINE-IP


