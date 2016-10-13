#!/bin/bash
if [ "$1" == "--help" ]
then
	echo "This is getip. It allows you to get ip."
	echo "If you need to get ip, type getip."
	echo "Author: Pavel Koshara"
else
	ifconfig | grep -o -E "inet addr:([0-9]{1,3}[\.]){3}[0-9]{1,3}" | grep -v "127.0.0.1" | grep -o -E "([0-9]{1,3}[\.]){3}[0-9]{1,3}" || echo "No ip's were found"
fi
