sudo su
#install chef client
apt-get install curl git -y
echo "10.20.2.85     chefserver" >> /etc/hosts
#curl -L https://www.opscode.com/chef/install.sh | sudo bash
