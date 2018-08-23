# V2ray_loger
这是一个处理v2ray服务端连接记录的小脚本。

他能做什么？？

他可以把今天使用你v2ray服务器翻墙的人的ip告诉你（嘿嘿嘿）。

他是如何工作的？？

emmmm..就是一个简单的shell脚本，通过调用ipip.net的Free api完成。

他会更新吗？？

额，目前是0.1.1版本之后会加入一些新功能的。有什么好的建议，及反馈意见请提交issue。

你写的代码好low啊！！

（滑稽）小弟才疏学浅，还望大佬指教，欢迎Pull request。


# 版本及修订说明

版本号 v0.0.2

修改了安装脚本系统判断方法，增加了对Ubuntu的支持。

版本号 v0.1.1

增加了每个ip开始连接和断开连接的日志。

# 小贴士

关于中文无法正常显示的问题。

ssh端中文无法正常显示。请检查系统环境变量运行 env 查看 LANG=en_US.UTF-8 如果不为这个值。请运行 export LANG=en_US.UTF-8

如果仍然不正常请检查 （以debian ubuntu为例） dpkg-reconfigure locales 在第一个选项卡中选择 en_US.UTF-8 zh.CN.UTF-8

并在第二个选项卡中选择en_US.UTF-8作为默认语言。

关于运行export LANG=en_US.UTF-8 后中文显示正常，但重启之后又不正常的解决方案

在 /etc/profile 文件中增加一行 export LANG=en_US.UTF-8 使其变为系统环境变量即可。
