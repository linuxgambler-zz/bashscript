#!/bin/bash

#Title		: email.sh
#Author  	: Sagar Malve
#Purpose 	: This script is design to validate user Email ID
#Date    	: Monday 18 July 2016 03:47:22 PM IST
#Version	: 0.1
#BASH_VERSION   : Tested on GNU BASH version 4.3.11
#OS Specs 	: Ubunt 14.04 LTS

read -p "Enter Email ID :" email

if echo "$email" | grep -qE '^[A-Za-z0-9_.]*@[A-Za-z0-9.-]*\.[A-Za-z]{2,3}$'
 then
    echo "$email is valid Email ID"
else
    echo "Entered Email ID: $email is not valid"
fi
