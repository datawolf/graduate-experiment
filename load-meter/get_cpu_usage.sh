#!/bin/bash

#  This script get the cpu usage of the system.
#  Author: Wang Long ( wanglong@cse.buaa.edu.cn )
set -x  

#  echo user nice system idle iowait irq softirq
CPULOG_START=$(cat /proc/stat | grep 'cpu ' | awk '{print $2" "$3" "$4" "$5" "$6" "$7" "$8}')
#  Get the start system idle time
SYS_IDLE_START=$(echo $CPULOG_START | awk '{print $4}')
#  Get the start system total time
TOTAL_START=$(echo $CPULOG_START | awk '{print $1+$2+$3+$4+$5+$6+$7}')

#  sleep five seconds.
sleep 5

#  echo user nice system idle iowait irq softirq
CPULOG_END=$(cat /proc/stat | grep 'cpu ' | awk '{print $2" "$3" "$4" "$5" "$6" "$7" "$8}')
#  Get the end system idle time
SYS_IDLE_END=$(echo $CPULOG_END | awk '{print $4}') 
#  Get the end system total time
TOTAL_END=$(echo $CPULOG_END | awk '{print $1+$2+$3+$4+$5+$6+$7}')

#  During the five seconds, the total idle time
SYS_IDLE=`expr $SYS_IDLE_END - $SYS_IDLE_START`

#  During the five seconds, the total time
TOTAL=`expr $TOTAL_END - $TOTAL_START`

#  Calucate the cpu idle usage.
SYS_USAGE=`expr $SYS_IDLE/$TOTAL*100 | bc -l`

#  Calucate the cpu usage.
SYS_CPU_USAGE=`expr 100-$SYS_USAGE | bc -l`

#  Format the dispaly
DISP_CPU_USAGE=`expr "scale=4; $SYS_CPU_USAGE/1" | bc`

#  Get the time now
TIME=`date -d now +%G-%m-%d-%H-%M-%S`

#  The filename which store the cpu usage.
FILENAME=~/$(date -d now +%G-%m-%d-%H)-cpu-usage.txt

#  Output the cpu usage to file
echo $TIME		$DISP_CPU_USAGE%	>> $FILENAME
