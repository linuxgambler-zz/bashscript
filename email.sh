#!/bin/bash

#Author  : Sagar Malve
#Purpose : Email Validation Script
#Date    : Monday 18 July 2016 03:47:22 PM IST


read -p "Enter Email ID :" email

if echo "$email" | grep -qE '^[A-Za-z0-9_.]*@[A-Za-z0-9.-]*\.[A-Za-z]{2,3}$'
 then
    echo "$email is valid Email ID"
else
    echo "Entered Email ID: $email is not valid"
fi
