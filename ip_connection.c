#include<stdio.h>
#include<string.h>
void seek_stop(FILE *fp,char *date,char *time,char *level,char *type,char *serial_num,char *str1,char *str2,char *str3,char *ip,int *flag)
{
	char stop[]="terminating";
	do
	{
		fscanf(fp,"%s %s %s %s %s %s %s %s %s",date,time,level,type,serial_num,str1,str2,str3,ip);
		(*flag)++;
	}
	while(strcmp(str1,stop) && (*flag)<=100);
}
void seek_start(FILE *fp,char *date,char *time,char *level,char *type,char *serial_num,char *str1,char *str2,char *str3,char *ip,int *flag)
{
	char start[]="creating";
	char temp[10];
	do
	{
		fscanf(fp,"%s %s %s %s %s %s %s %s %s:%s",date,time,level,type,serial_num,str1,str2,str3,ip);
		(*flag)++;
	}
	while(strcmp(str1,start)  && (*flag)<=100);
}
void main()
{
	FILE *fp,*fp1;
	char date[200],time[200],level[200],type[300],serial_num[200],str1[500],str2[500],str3[500],ip[500];
	int flag=0;
	fp=fopen("/tmp/v2ray_log/temp.log","r");
	fp1=fopen("/tmp/v2ray_log/ip_connection.log","w+");
	while(1)
	{
		seek_start(fp,date,time,level,type,serial_num,str1,str2,str3,ip,&flag);
		if(flag>=100) break;
		else 
		{
			fprintf(fp1,"%s 连接开始于 %s\n",ip,time);
			flag=0;
		}
		seek_stop(fp,date,time,level,type,serial_num,str1,str2,str3,ip,&flag);
		if(flag>=100) break;
		else 
		{
			fprintf(fp1,"%s 连接结束于 %s\n",ip,time);
			flag=0;
		}
	}
	fclose(fp);
	fclose(fp1);
} 

