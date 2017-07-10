#!/bin/bash
mkfifo /root/bfifo2
set -o noclobber
set +e
while read -r < /root/bfifo2 line; do
	printf "LOG: %s - Length: %s\n" "$line" "${#line}";
	exec "$line";
done
