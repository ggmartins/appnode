#!/bin/sh

if [ -f /etc/init.d/docker ]; then
  echo "appnode install: Docker is installed."
else
  echo "appnode install: Docker is NOT present. Please install Docker 1.5 or greater."
fi

echo "Installing/Upgrading puppet ..."


#cd /tmp 
#wget https://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
#dpkg -i puppetlabs-release-wheezy.deb
#rm puppetlabs-release-wheezy.deb
#apt-get update
#cd -
#apt-get -yq install puppet

if [ ! -f /etc/init.d/appnode_init ];then
  ln -s /opt/appnode/etc/init.d/appnode_init /etc/init.d/appnode_init
fi

if [ -f /etc/salt/minion ];then
  mv /etc/salt/minion /etc/salt/minion.original
  ln -s /opt/appnode/etc/salt/minion /etc/salt/minion
  /etc/init.d/salt-minion start
  exit 0
else
  echo "appnode install error: file /etc/puppet/puppet.conf not preset"
  exit 3
fi

if [ -f /etc/puppet/puppet.conf ];then
  mv /etc/puppet/puppet.conf /etc/puppet/puppet.conf.original
  ln -s /opt/appnode/etc/puppet/puppet.conf /etc/puppet/puppet.conf
  ln -sf /opt/appnode/etc/default/puppet /etc/default/puppet
  /etc/init.d/puppet start
else
  echo "appnode install error: file /etc/puppet/puppet.conf not preset"
  exit 3
fi



