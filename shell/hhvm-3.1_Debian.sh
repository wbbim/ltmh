#!/bin/bash
Install_hhvm()
{
cd $ltmh_dir/src
. ../tools/download.sh 
. ../tools/check_os.sh
. ../options.conf

src_url=http://dl.hhvm.com/debian/pool/main/h/hhvm/hhvm_3.1.0~wheezy_amd64.deb && Download_src

wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -
echo deb http://dl.hhvm.com/debian wheezy main | tee /etc/apt/sources.list.d/hhvm.list
apt-get update
#aptitude upgrade
apt-get -y install hhvm
apt-get -y remove hhvm
dpkg -i hhvm_3.1.0~wheezy_amd64.deb
/usr/share/hhvm/install_fastcgi.sh 
update-rc.d hhvm defaults 
service hhvm restart 
}
