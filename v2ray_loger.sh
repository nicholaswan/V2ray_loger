#!/bin/bash

echo "欢迎使用v2ray_loger 配置工具"

echo "1.修改接收邮箱"
echo "2.设置计划任务(设置后可每天定时发送日志到邮箱)"
echo "3.立即发送日志到邮箱(debug)"

read temp

case $temp in
1) addr=`sed -n "1p" /etc/v2ray/mail_addr.config`
   echo "请输入新的邮箱地址"
   echo "现在的邮箱地址是 $addr"
   read temp_addr
   rm -f /etc/v2ray/
   echo $addr >> /etc/v2ray/mail_addr.config
   echo "邮箱修改成功"

   ;;

2) echo "请输入发送日志的时间"
   echo "请输入小时"
   read temp_hour
   echo "请输入分钟"
   read temp_min
   echo "$temp_min $temp_hour * * * bash /usr/v2ray_loger/api.sh" >> /var/cornfile_v2ray_loger
   crontab /var/cornfile_v2ray_loger

   ;;

3) bash /usr/v2ray_loger/api.sh
   echo "执行成功"

   ;;

*) echo "请输入正确的数字（不要调戏程序）"

   ;;

esac



