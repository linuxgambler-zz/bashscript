#!/bin/bash
  echo  "Define Filter Chain\n
  1) INPUT
  2) OUTPUT
  3) Forward"
  read filter
  case $filter in
   1) chain="INPUT" ;;
   2) chain="OUTPUT" ;;
   3) chain="FORWARD" ;;
   *) echo "Usage: please select {INPUT | OUTPUT | FORWARD} chain "
  esac

  #########Define Source IP Address##########
  
   
  echo "
  1. Source IP\n
  2. Source Subnet\n
  3. All Source Networks\n"
  read src_ip
   
  case $src_ip in
   1) echo "Please Enter the IP Address of the Source"
   read ip_source ;;
   2) echo  "Please Enter the Source Subnet (e.g 192.168.1.0/24)"
   read ip_source ;;
   3) ip_source="0/0" ;;
   *) echo "Wrong Input"
  esac

  #########Getting Destination IP Address##########
   echo "
        1) Destination IP\n
        2) Destination Subnet\n
        3) Destination Networks\n"
  
     read des_ip

        case $des_ip in

        1) echo -e "Please Enter the IP Address of the Destination"
        read ip_des ;;
        
        2) echo -e "Please Enter the Destination Subnet (e.g 192.168.1.0/24)"
        read ip_des ;;
        
        3) ip_des="0/0" ;;
        
        *) echo -e "Wrong Input"
       esac


 ###############Define Rule for Service Iptable#############
       echo "
       1) Block All Traffic
       2) Block Specific Traffic
       3) Block Specific Port
       4) Using no Protocol"
       read protocol
       case $protocol in
        1) protocol=TCP ;;
        
        2) echo "Service Name:"
           read protocol ;;
        
        3) echo "Port Name:" 
           read protocol ;;
        
        4) protocol="NULL" ;;
        
        *) echo "Wrong Input"
       esac



 ############# Rule Defined here ############# 
       echo "Define Rule:
       1) Accept Packet
       2) Reject Packet
       3) Drop Packet
       4) Create Log"
       read rule
       case $rule in 
        1) rule="ACCEPT" ;;
        2) rule="REJECT" ;;
        3) rule="DROP" ;;
        4) rule="LOG" ;;
       esac


echo "Generate Rule"
read rule_gen
echo "Defined Rule is \n"
if [ $protocol == "NULL" ]
 then
 echo "iptables -A $chain -s $ip_source -d $ip_des -j $rule"
 rule_gen=1
else
 echo "iptables -A $chain -s $ip_source -d $ip_des -p $protocol -j $rule"
 rule_gen=2
fi 
echo "Shall we proceed Yes=1 , No=2"
read res
if [ $res == 1 ] && [ $rule_gen == 1 ]
then
 iptables -A $chain -s $ip_source -d $ip_des -j $rule
else if [ $res == 1 ] && [ $rule_gen == 2 ]
 then
 iptables -A $chain -s $ip_source -d $ip_des -p $protocol -j $rule         
   
else if [ $res == 2 ]
then
 exit 1
fi
fi
fi
