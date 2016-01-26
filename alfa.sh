#!/bin/sh
echo Loading Appropriate Driver
rmmod rtl8187
rfkill block all
rfkill unblock all
modprobe rtl8187
rfkill unblock all
ifconfig wlan0 up

echo Killing all necessary Processes
airmon-ng check kill

echo Double Checking
airmon-ng check kill

echo Starting Monitor Interface Mon0
#change wlan0 to the Alfa wifi interface if it is not wlan0
airmon-ng start wlan0

echo AiroDump
#change mon0 to the new monitoring interface if it is not mon0
airodump-ng mon0

