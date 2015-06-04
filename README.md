# <a href="http://appnode.space">appnode</a>
<img src="https://raw.githubusercontent.com/ggmartins/appnode/master/docs/images/appnode_image1.png" /><br>
<b>Current available docker containers:</b>
 * BISmark (Broadband Internet Service benchmark);
 * Seattle (Open Peer-to-Peer Computing);
 * Your Project Here;
 
<b>Supported hardware/OS:</b>
 * Raspberry PI B+ / <a href="http://appnode.space/downloads/">Raspbian HypriotOS</a><br>
 


<b>Steps to build an appnode application container:</b><br>
 Choose Configuration Management System Client ( <a href="http://docs.saltstack.com/en/latest/topics/installation/debian.html">SaltStack</a> OR <a href="https://docs.puppetlabs.com/guides/install_puppet/install_debian_ubuntu.html">Puppet</a> )<br>
 $git clone https://github.com/ggmartins/appnode.git<br>
 $cd appnode/build/images<br>
 $./build.sh<br>
   or<br>
 $cd project; docker build -t username/project_armhf .; cd -<br>
<br>
<b>Steps to deploy an appnode application container:</b><br>
 $wget http://appnode.space/downloads/<a href="http://appnode.space/downloads/appnode_0.8-1_armhf.deb">appnode_0.8-1_armhf.deb</a> or <a href="http://appnode.space/downloads/appnode_0.8-1_amd64.deb">appnode_0.8-1_amd64.deb</a><br>
 $cd /opt/appnode/scripts<br>
 $./appnode_set_timezone_and_hostname.sh (reboot)<br>
 $cd /opt/appnode/scripts<br>
 $./appnode_install.sh<br>
 $/etc/init.d/appnode_init start<br>

