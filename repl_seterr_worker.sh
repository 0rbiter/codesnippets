#!/bin/bash
find /root/check-mk-raw-1.2.8p11.cre/* -iname '*' -type f -exec repl_seterr "{}" \;
