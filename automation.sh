#!/bin/bash


sudo apt update -y
echo "pkg updated"
dpkg --get-selections | grep apache2
echo "checked apache2 installed or not"
echo $?
sudo apt-get install apache2 
echo "installed apache2"
sudo systemctl status service apache2
echo "checked apache2 status"
sudo systemctl enable apache2
echo "enable apache 2"
systemctl list-unit-files --state=enabled | grep apache2 
echo "checked apache2 enabled or not"
 ps -ef | grep apache2
 echo "checked apache 2 running or not"
 
myname=varsha
timestamp=$(date '+%d%m%Y-%H%M%S')
cd  /var/log/apache2/
ls
tar -cvf ${myname}-httpd-logs-${timestamp}.tar *.log
mv varsha-httpd-logs-07072022-*.tar /tmp 
sudo apt update
sudo apt install awscli -y

s3_bucket=upgrad-varsha

aws s3 \cp /tmp/${myname}-httpd-logs-${timestamp}.tar \
s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar
echo "tar uploaded to s3"








 
