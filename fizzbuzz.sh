#!/bin/bash

##############################################################################################################
#													     #
#		Title		:	sysreport.sh							     #	
#		Author		: 	Sagar Malve							     #
#		Purpose 	: 	If number is divisible by 3 print "Fizz" instead of the number and   #
#					for the multiples of 5 print "Buzz" For numbers which are            #
#					multiples of both 3 and 5 print "FizzBuzz".	    		     #		
#		Date		:	Wed Oct 19 19:22:43 IST 2016					     #		
#		Version 	: 	0.1								     #
#		Bash_Version	:	Tested on GNU BASH version 4.3.11				     #
#		OS Specs	:	Ubuntu 14.04 LTS						     #		
#													     #			
##############################################################################################################


i=1
	while [ $i -le 100 ]
	do 
		if [[ $(($i%3)) -eq 0 ]] && [[ $((i%5)) -eq 0 ]]
		then
		echo "FizzBuzz"
		
		elif [[ $((i%3)) -eq 0 ]]
		then
			echo "Fizz"
	
		elif [[ $(($i%5)) -eq 0 ]]
		then
			echo "Buzz"

		else
			echo $i
		fi
	i=$((i+1))
	done
