sudo su
#install chef client
apt-get update
apt-get install curl git -y
wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chef-server_11.0.8-1.ubuntu.12.04_amd64.deb
dpkg -i chef-server_11.0.8-1.ubuntu.12.04_amd64.deb

chef-server-ctl reconfigure

echo "nginx['enable_non_ssl'] = true" > /etc/chef-server/chef-server.rb
echo "nginx['non_ssl_port'] = 8888"  >> /etc/chef-server/chef-server.rb

chef-server-ctl reconfigure

chef-server-ctl restart

