#!/bin/bash

mail_addr=`cat /etc/v2ray/mail_addr.config`
echo "It is used to send v2ray log to your mail by mailx"
echo "It will creat a temp file in tmp folder"
dir="/tmp/v2ray_log/"
mkdir -p $dir
cat /var/log/v2ray/error.log | grep `date +%y/%m/%d` | grep "creating connection to" >> $dir"v2ray_connection.log"
echo "collection connecting infomation finished"
cd /usr/v2ray_loger
./a.out
echo "如无法继续可能是今日并没有人使用v2ray服务器..."
sort -u /tmp/ip_list_tmp.db >> /tmp/ip.db
i=`cat /tmp/ip.db | wc -l`
until [ $i -le 0 ]
do
ip=`sed -n "$i p " /tmp/ip.db`
cat /var/log/v2ray/error.log | grep `date +%y/%m/%d` | grep -E "terminating connection to|creating connection to" | grep $ip >> $dir"temp.log"
cd /usr/v2ray_loger
./b.out
dest=`curl http://freeapi.ipip.net/$ip`
echo $ip $dest >> /tmp/ip_result.log
cat $dir"ip_connection.log" >> /tmp/ip_result.log
rm -f $dir"ip_connection.log"
rm -f $dir"temp.log
sleep 5
((i--))
done
echo "this is the connection log at `date`" | mail -s "project V LOG" -a /tmp/ip_result.log $mail_addr
echo "邮件发送成功"

cd /tmp
rm -rf *
echo "日志清理完成"

