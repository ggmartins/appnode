#!/bin/sh
new_hostname=PI$(date +"%Y%m%d%H%m")
read -r -p "appnode: This script will set the timezone to UTC and hostname to $new_hostname and REBOOT after. Are you sure want to proceed? [y/N] " response
case $response in
    [yY][eE][sS]|[yY]) 
	ln -sf /usr/share/zoneinfo/UTC /etc/localtime
	echo "Etc/UTC" > /etc/timezone
        echo $new_hostname > /etc/hostname
	/sbin/reboot
        echo Done.
	;;
    *)
        echo "Bye."
        ;;
esac

