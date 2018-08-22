#!/bin/bash

chmod 777 *
echo "运行该脚本前请确定mailx已成功部署 回车键继续"
read a
echo "mailx 部署脚本可以使用我的 mailx部署脚本"
echo "https://github.com/sjz123321/mailx-bash-shell-1  回车键继续"
read a
apt-get update && apt-get install gcc -y
apt-get install curl -y
mkdir -p /usr/v2ray_loger/
cp api.sh /usr/v2ray_loger/
gcc process.c
cp a.out /usr/v2ray_loger/
cp v2ray_loger.sh /usr/bin
cd /tmp
rm -rf *
echo "请输入mail地址"
read temp
echo $temp >> /etc/v2ray/mail_addr.config
echo "邮箱地址设置成功"
echo "将发送一个测试邮件到您设置的邮箱"
echo "test_text" >> /tmp/test_text.log
echo "Project V loger installed successfully" | mail -s "Test mail" -a /tmp/test_text.log $temp
echo "如果您没有收到邮件请检查 邮箱地址是否错误 您可以通过修改/etc/v2ray/mail_addr.config 来修改您设置的邮箱地址"

