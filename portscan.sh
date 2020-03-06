#!/bin/bash

echo Grabbing ports...
scan=$(sudo nmap -p- -T4 $1 )
ports=$( ${scan} | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)  
echo Ports grabbed!
echo Scanning...
echo $ports
sudo nmap -sC -sV -Pn -p $ports $1 $2 $3