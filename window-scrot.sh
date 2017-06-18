#!/bin/bash

year=$(date +%Y)

[ ! -d ~/Dropbox/Screenshots/$year ] && mkdir -p ~/Dropbox/Screenshots/$year

scrot -s '%Y-%m-%d-%H_%M_%S.png' -d "0.03" -e "mv \$f ~/Dropbox/Screenshots/$year/" && notify-send -t 1000 "Screenshot taken /n $f"