#!/bin/bash
PASSED=$1
if [[ -f $1 ]] && [[ ! -d $1 ]]; then
	exit 0;
else
	exit 1;
fi
	
