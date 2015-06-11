#!/bin/sh

if [ “$(id -u)” != “0” ]; then
  echo "appnode install error: this script must be run as root." 2>&1
  exit 1
fi

echo "Installing CMS SaltStack..."
echo "deb http://debian.saltstack.com/debian wheezy-saltstack main" > /etc/apt/sources.list.d/salt.list
apt-get update
apt-get install -qy salt-minion

if [ -f /etc/init.d/docker ]; then
  echo "appnode install: Docker is installed."
else
  echo "appnode install: Docker is NOT present. Please install Docker 1.5 or greater."
fi

echo "Installing appnode support for CMS..."

if [ ! -f /etc/init.d/appnode_init ];then
  ln -s /opt/appnode/etc/init.d/appnode_init /etc/init.d/appnode_init
fi

if [ -f /etc/salt/minion ];then
  mv /etc/salt/minion /etc/salt/minion.original
  ln -s /opt/appnode/etc/salt/minion /etc/salt/minion
  /etc/init.d/salt-minion restart
  exit 0
else
  echo "appnode install error: file /etc/salt/minion not preset"
  exit 3
fi

if [ -f /etc/puppet/puppet.conf ];then
  mv /etc/puppet/puppet.conf /etc/puppet/puppet.conf.original
  ln -s /opt/appnode/etc/puppet/puppet.conf /etc/puppet/puppet.conf
  ln -sf /opt/appnode/etc/default/puppet /etc/default/puppet
  /etc/init.d/puppet restart
else
  echo "appnode install error: file /etc/puppet/puppet.conf not preset"
  exit 3
fi



