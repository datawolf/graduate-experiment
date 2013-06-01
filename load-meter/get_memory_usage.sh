#!/bin/bash

#  This script get the memory usage of the system.
#  Author: Wang Long ( wanglong@cse.buaa.edu.cn )
set -x

#  Get the total memory in the system.
TOTAL_MEM=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')

#  Get the free memory in the system.
FREE_MEM=$(cat /proc/meminfo | grep MemFree | awk '{print $2}')

# Get the buffered memory in the system
BUFFERED_MEM=$(cat /proc/meminfo | grep Buffers | awk '{print $2}')

# Get the cached memory in the system
CACHED_MEM=$(cat /proc/meminfo | grep Cached  | grep -v SwapCached | awk '{print $2}')

#  Calculate the used memory in the system.
USED_MEM=`expr $TOTAL_MEM - $FREE_MEM - $BUFFERED_MEM - $CACHED_MEM`

#  Calculate the memory usage in the system.
MEM_USAGE=`expr $USED_MEM/$TOTAL_MEM*100 | bc -l`

#  Format the display for memory usage.
DISPLAY_MEM_USAGE=`expr "scale=4; $MEM_USAGE/1" | bc`

#  Get the time now
TIME=`date -d now +%G-%m-%d-%H-%M-%S`

#  The filename which store the memory usage.
FILENAME=~/$(date -d now +%G-%m-%d-%H)-memory-usage.txt


#  Output the memory usage to file
echo $TIME		$DISPLAY_MEM_USAGE%	>> $FILENAME

