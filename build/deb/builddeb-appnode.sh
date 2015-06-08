#!/bin/bash

VER=0.8
export DEB_BUILD_OPTIONS=nostrip
TARGETDIR=appnode-$VER

rm -rf appnode
rm -rf $TARGETDIR
git clone https://github.com/ggmartins/appnode.git
if [ $1 = "nodownload" ];
 then
    echo "Not checking out/downloading latest code, using existing dir $TARGETDIR..."
 else
    mv appnode $TARGETDIR
#    cd $TARGETDIR
#    git checkout debian
#    cd -
fi

tar cvzf appnode_$VER.orig.tar.gz $TARGETDIR
mkdir -p $TARGETDIR/debian
mkdir -p $TARGETDIR/debian/source

cat << "EOF" | tee $TARGETDIR/debian/changelog > /dev/null
appnode (APPNODEVERSION-1) UNRELEASED; urgency=low

  * Initial release. (Closes: #XXXXXX)

 -- Guilherme Grillo Martins <gmartins@cc.gatech.edu>  Wed, 11 May 2015 18:01:56 +0000
EOF

sed -i "s/APPNODEVERSION/$VER/g" $TARGETDIR/debian/changelog

echo "9" > $TARGETDIR/debian/compat

cat << "EOF" | tee $TARGETDIR/debian/control > /dev/null
Source: appnode
Maintainer: Guilherme G. Martins <gmartins@cc.gatech.edu>
Section: misc
Priority: optional
Standards-Version: 3.9.4
Build-Depends: debhelper (>= 9)

Package: appnode
Architecture: any
Depends: ${shlibs:Depends}, ${misc:Depends}, docker-hypriot
Description: This is the Control package for AppNode Space
 Distributed Container Computing Space

EOF

cat << "EOF" | tee $TARGETDIR/debian/postinst > /dev/null
#!/bin/bash
set -e
if [ -f /etc/init.d/appnode_init ]; then
	chmod +x /etc/init.d/appnode_init
	/etc/init.d/appnode_init start
	update-rc.d -f appnode_init defaults
fi
#DEBHELPER#
EOF


cat << "EOF" | tee $TARGETDIR/debian/postrm > /dev/null
#!/bin/bash
set -e
if [ -x /etc/init.d/appnode_init ]; then
  update-rc.d -f appnode_init remove
fi
rm -f /etc/cron.d/appnode_management
#DEBHELPER#
EOF
chmod +x $TARGETDIR/debian/postrm


touch $TARGETDIR/debian/copyright

cat << "EOF" | tee $TARGETDIR/debian/rules > /dev/null
#!/usr/bin/make -f
export DH_VERBOSE=1
%:
	dh $@
override_dh_usrlocal:
override_dh_auto_install:
	mkdir -p $$(pwd)/debian/appnode/etc/init.d/
	mkdir -p $$(pwd)/debian/appnode/opt/appnode/bin
	mkdir -p $$(pwd)/debian/appnode/opt/appnode/images/load
	mkdir -p $$(pwd)/debian/appnode/opt/appnode/images/run
	mkdir -p $$(pwd)/debian/appnode/opt/appnode/images/unload
	mkdir -p $$(pwd)/debian/appnode/opt/appnode/etc/puppet
	mkdir -p $$(pwd)/debian/appnode/opt/appnode/etc/salt
	mkdir -p $$(pwd)/debian/appnode/opt/appnode/etc/default
	mkdir -p $$(pwd)/debian/appnode/opt/appnode/log
	mkdir -p $$(pwd)/debian/appnode/opt/appnode/scripts

	cp $$(pwd)/appnode/bin/* $$(pwd)/debian/appnode/opt/appnode/bin/
	cp $$(pwd)/appnode/etc/init.d/appnode_init $$(pwd)/debian/appnode/etc/init.d/
	cp $$(pwd)/appnode/etc/puppet/* $$(pwd)/debian/appnode/opt/appnode/etc/puppet/
	cp $$(pwd)/appnode/etc/salt/* $$(pwd)/debian/appnode/opt/appnode/etc/salt/
	cp $$(pwd)/appnode/etc/default/puppet $$(pwd)/debian/appnode/opt/appnode/etc/default/
	cp $$(pwd)/appnode/scripts/* $$(pwd)/debian/appnode/opt/appnode/scripts/

EOF


chmod +x $TARGETDIR/debian/rules

cd $TARGETDIR
debuild -us -uc
#debuild -ai386 -us -uc
cd -

echo END
