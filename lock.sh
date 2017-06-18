#!/bin/bash

set -o nounset
set -o errexit

# sleep 1

i3lock -n -ti $(tail -n 1 ~/.fehbg | cut -d' ' -f 4- | tr -d "'" )