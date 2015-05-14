# appnode
<i><b>A project for containerize multiple research platforms using docker images.</b></i>

<b>Current available docker containers:</b>
 * BISmark (Broadband Internet Service benchmark);
 * Seattle (Open Peer-to-Peer Computing);
 * Your Project Here;
 
<b>Supported hardware/OS:</b>
 * Raspberry PI B+ / Raspbian HypriotOS
 


<b>Steps to build:</b><br>
 $git clone https://github.com/ggmartins/appnode.git<br>
 $cd appnode/build/images<br>
 $./build.sh<br>
   or<br>
 $cd project; docker build -t username/project_armhf .; cd -<br>
<br>
<b>Steps to deploy:</b><br>
 $git clone https://github.com/ggmartins/appnode.git<br>
 $cd appnode;cp appnode /opt/ -R<br>
 $cd /opt/appnode/scripts<br>
 $./appnode_set_timezone_and_hostname.sh (reboot)<br>
 $cd /opt/appnode/scripts<br>
 $./appnode_install.sh<br>
 $/etc/init.d/appnode_init start<br>

