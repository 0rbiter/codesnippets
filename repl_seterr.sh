#!/bin/bash
#stdbuf -i0 -o0 -e0
/bin/sed -si 's/set -e/set +e/g' "$1"
