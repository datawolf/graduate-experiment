load-meter
==========


* `get_cpu_usage.sh`: this script measuring the system's cpu utilization.

* `get_memory_usage.sh`: this script measuring the system's memory utilization.

If you want to measuring cpu and memory utilization every one minute, you can
add the file `get-memory-cpu-usage` in the directory `/etc/cron.d`, and
modified the script position. For example, if the shell script place in the 
`/home/shell/` directory, the file `get-memory-cpu-usage` is the following:
 
     # Run get_memory_usage.sh every one  minute.
     # Run get_cpu_usage.sh every one minutes.
     
     */1 * * * * wanglong /home/shell/get_memory_usage.sh
     */1 * * * * wanglong /home/shell/get_cpu_usage.sh
