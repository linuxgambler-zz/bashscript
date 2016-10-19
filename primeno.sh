#!/bin/bash 

##############################################################################################################
#													     #
#		Title		:	primeno.sh							     #	
#		Author		: 	Sagar Malve							     #
#		Purpose 	: 	This script is design to print if the number is Prime no or not.     #		
#		Date		:	Wed Oct 19 19:10:17 IST 2016					     #		
#		Version 	: 	0.1								     #
#		Bash_Version	:	Tested on GNU BASH version 4.3.11				     #
#		OS Specs	:	Ubuntu 14.04 LTS						     #		
#													     #			
##############################################################################################################


flag=0
read -p "Enter no" nos;
        while [[ "$nos" =~ ^[A-Za-z!@$%^]+$ ]] ||  [ -z $nos ] 
        do
                read -p "Enter enter Integer:" nos;
        done

        for (( i=2; i<nos; i++ ))
        do
                prime=`expr $nos % $i`
                if [ $prime -eq 0 ]
                then
                        flag=1
                fi
        done

        if [ $flag -eq 1 ]
        then
                echo "$nos is not prime number"
        else
                echo "$nos is prime number"
        fi

