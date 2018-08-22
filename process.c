#define EOF -1
#include<stdio.h>
#include<string.h>
void restore(char *temp)
{
  FILE *fp1;
  fp1=fopen("/tmp/ip_list_tmp.db","a+");
  fputs(temp,fp1);
  fputc('\n',fp1);
  fclose(fp1);
}
void cut_ip(char *array_raw)
{
  char array_temp[100];
  int i=0;
  while((*(array_raw+(i++)))!='t' || ((*(array_raw+(i)))!='o'))
  {
    ;
  }
  i=i+2;
  int j=0;
  int count=0;
  int flag=1;
  while((*(array_raw+(i++)))!=':')
  {
    array_temp[j++]=(*(array_raw+i-1));
  }
  array_temp[j]='\0';
  restore(array_temp);
}

void readfile()
{
  FILE *fp;
  fp=fopen("/tmp/v2ray_log/v2ray_connection.log","r");
  char j;
  int i=0;
  while(fgetc(fp)!=EOF)
  {
    fseek(fp,-1,SEEK_CUR);
    char temp[100]="";
    temp[0]='\0';
    do
      {
        j=fgetc(fp);
        temp[i++]=j;
      }
    while(j!='\n');
    temp[--i]='\0';
    cut_ip(temp);
    i=0;
    j='\0';
  }
  fclose(fp);
}
void main()
{
  readfile();
}

