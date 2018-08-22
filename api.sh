#!/bin/bash

mail_addr=`cat /etc/v2ray/mail_addr.config`
echo "It is used to send v2ray log to your mail by mailx"
echo "It will creat a temp file in tmp folder"
dir="/tmp/v2ray_log/"
mkdir -p $dir
cat /var/log/v2ray/error.log | grep `date +%y/%m/%d` >> $dir"v2ray.log"
cat $dir"v2ray.log" | grep "creating connection to" >> $dir"v2ray_connection.log"
echo "collection connecting infomation finished"
./a.out
sort -u /tmp/ip_list_tmp.db >> /tmp/ip.db
i=`cat /tmp/ip.db | wc -l`
until [ $i -le 0 ]
do
ip=`sed -n "$i p " /tmp/ip.db`
dest=`curl http://freeapi.ipip.net/$ip`
echo $ip $dest >> /tmp/ip_result.log
sleep 5
((i--))
done
echo "this is the connection log at `date`" | mail -s "project V LOG" -a /tmp/ip_result.log $mail_addr

cd /tmp
rm -rf *
echo "日志清理完成"

