#! /bin/sh
request=`echo $@ | awk '{print $1}'`
user=`echo $@ | awk '{print $NF}'`
stamp=`date +%s`
myhost=`hostname`
datenow=`date +%m/%d/%Y`; timenow=`date +%T`;
echo $datenow $timenow $myhost queued $user $request $stamp >> Data/TopStorqueue.log
request=`echo $@ | awk '{print $1}'`
pgrep $request 
if [ $? -ne 0 ];
then
 echo $@  > Data/pump.txt;
 echo $@ > /tmp2/msgfile;
else
 echo $@ already running > Data/pump.txt;
fi 
