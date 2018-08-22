echo "运行该脚本前请确定mailx已成功部署 回车键继续"
read a
echo "mailx 部署脚本可以使用我的 mailx部署脚本"
echo "https://github.com/sjz123321/mailx-bash-shell-1  回车键继续"
read a
apt-get update && apt-get install gcc -y
yum update && yum -y install gcc
c_version=`gcc --version`

if [ "$c_version" != "" ] ; then
	echo "gcc 安装成功"
else
	echo "gcc 安装失败，请检查或手动安装gcc"

mv api.sh /usr/bin/vloger.sh
gcc process.c
mv a.out /usr/bin/process.out
cd /tmp
rm -rf *
echo "请输入mail地址"
read temp
echo $temp >> /etc/v2ray/mail_addr.config
echo "邮箱地址设置成功"
echo "将发送一个测试邮件到您设置的邮箱"
echo "Project V loger installed successfully" | maill -s "Test mail" -a /tmp/test_text.log $temp
echo "如果您没有收到邮件请检查 邮箱地址是否错误 您可以通过修改/etc/v2ray/mail_addr.config 来修改您设置的邮箱地址"

