#!/bin/bash

#     Title           : delete.sh
#`    Author          : Sagar Malve	
#     Purpose         :	To sort files in ascending order and delete the  first file found in ascending order.	
#     Date   	      : Thu Oct 20 17:24:04 IST 2016
#     OS Specs	      :	Ubuntu 14.04 LTS
#     Bash_Version    :	Tested on GNU BASH version 4.3.11	

test=$(ls * | sort -V | head -1)

echo "Do you want to delete $test file"

read -p "Are you sure? " 

	if [[ $REPLY =~ ^[Yy]$ ]]
	then
    		rm -rf $test
	else
		echo "No changes made"
	fi
