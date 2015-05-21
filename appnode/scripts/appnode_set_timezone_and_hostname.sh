#!/bin/sh
new_hostname=PI$(date +"%Y%m%d%H%m")
read -r -p "appnode: This script will set the timezone to UTC and hostname to $new_hostname and REBOOT after. Are you sure want to proceed? [y/N] " response
case $response in
    [yY][eE][sS]|[yY]) 
	ln -sf /usr/share/zoneinfo/UTC /etc/localtime
	echo "Etc/UTC" > /etc/timezone
	echo $new_hostname > /etc/hostname
	if [ -f /boot/occidentalis.txt ];then
		sed -i.bak "s/hostname=black-pearl/hostname=$new_hostname/g" /boot/occidentalis.txt
	fi
	/sbin/reboot
	echo Done.
	;;
    *)
        echo "Bye."
        ;;
esac

