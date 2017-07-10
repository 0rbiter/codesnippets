#!/bin/bash
while [ 1 ]; do
	if [ ! -z "$1" ]; then
		echo "$@" >> bfifo2;
	fi;
	sleep 1;
done;
exit 0;
