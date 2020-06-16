#!/bin/bash

usb_usage=`df -m | grep "E:"`
#echo $usb_usage
used_space=`echo $usb_usage | awk '{print $3/1024.0}'`
avail_space=`echo $usb_usage | awk '{print $4/1024.0}'`
percent_used=`echo $usb_usage | awk '{print $5}'`
gb="GB"
echo "Used Space: $used_space$gb" >> $1
echo "Avail Space: $avail_space$gb" >> $1
echo "Percent Used: $percent_used" >> $1

