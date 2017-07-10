#!/bin/bash
find / -not \( -type b -o -type c -o -type p -o -type s -o -type l -o -path '/proc/*' -o -path '/sys/*' -o -path '/run/systemd/*' \) -a -iname '*' -exec bash -c '[[ ! -d {} ]] && grep -l \/usr\/bin\/terminator {}' \;
