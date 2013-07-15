#!/bin/bash
domain="http://ip.caonimei.org"
ip=`curl -s ifconfig.me`
echo $ip
url=$domain'/'$ip
echo $url
curl $url
