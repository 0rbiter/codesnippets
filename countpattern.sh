#!/bin/bash
grep -hnroP '^.*\Kset\s(\+|\-){1}[e]{1}$.*' /root/check-mk-raw-1.2.8p11.cre/* | wc -l
