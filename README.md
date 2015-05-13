# appnode
A project for containerize multiple research platforms using docker images.

Current available docker containers:
 * BISmark (Broadband Internet Service benchmark);
 * Seattle (Open Peer-to-Peer Computing);
 
Supported hardware/OS:
 * Raspberry PI B+ / Raspbian HypriotOS
 


Steps to build:
 $git clone https://github.com/ggmartins/appnode.git
 $cd appnode/build/images
 $./build.sh
   or
 $cd project; docker build -t username/project_armhf .; cd -

Steps to deploy: 
 $git clone https://github.com/ggmartins/appnode.git
 $cd appnode;cp appnode /opt/ -R
 $cd /opt/appnode/scripts
 $./appnode_set_timezone_and_hostname.sh (reboot)
 $cd /opt/appnode/scripts
 $./appnode_install.sh
 $/etc/init.d/appnode_init start

