#!/bin/bash

##############################################################################################################
#													     #
#		Title		:	sysreport.sh							     #	
#		Author		: 	Sagar Malve							     #
#		Purpose 	: 	This script is design to get System Report for Linux with bash.	     #		
#		Date		:	Wed Oct 12 19:55:55 IST 2016					     #		
#		Version 	: 	0.1								     #
#		Bash_Version	:	Tested on GNU BASH version 4.3.11				     #
#		OS Specs	:	Ubuntu 14.04 LTS						     #		
#													     #			
##############################################################################################################

line="=================================================================="


echo $line
echo "System report for $(hostname) on `date`"
echo $line

System_Uptime=$( uptime | sed 's/,//g' | awk '{print $3}')
total_cpu_core=$(grep -c processor /proc/cpuinfo)
Disk_Utilization=$(df -Th  | column -t)
Mem_Utilization=$(free -m | awk '/Mem/{print $2, MB}')
Free_Memory=$(free -m | awk '/Mem/{print $4, MB}')
Used_Memory=$(free -m | awk '/Mem/{print $3, MB}')
Load_Avg=$(cat /proc/loadavg | awk '{print "Current Load Avg= "$1" | " " Last 5 Min Load Avg=" $2 " | " " Last 15 Min Load Avg=" $3}')
Loggedin_User=$(w -h | awk '{print $1}')

echo $line
echo "System Uptime : $System_Uptime"
echo $line

echo $line
echo "System Load Avg : $Load_Avg"
echo $line

echo $line
echo "CPU Cores : $total_cpu_core"
echo $line

echo $line
echo "Currently Logged In Users on $(hostname) :" "\n$Loggedin_User"
echo $line

echo $line
echo "Total Memory : $Mem_Utilization" "MB"
echo "Free Memory  : $Free_Memory" "MB"
echo "Used Memory  : $Used_Memory" "MB"
echo $line

echo $line
echo  "Disk Utilization :"   "\n$Disk_Utilization"
echo $line
