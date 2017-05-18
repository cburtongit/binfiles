#!/bin/bash
#
# Watcher base on rsync over ssh 
#
# Usage:
#   ssh-rsync SSHKEYS SOURCE DESTINATIONS
#
#   SSHKEYS        Path to auth ssh keys
#   SOURCE         Path to watch source
#   DESTINATIONS   Path to destination on server
#
# Author: Ilya Reshetnikov
# License: MIT
# https://github.com/devxom/binfiles

SSHKEYS="$HOME/.ssh/id_rsa"
SOURCE="$(pwd)"
DESTINATIONS="/var/www"

usage() {
    cat << EOF
    $0

    Watcher base on rsync over ssh 
    
    Usage: $0 SSHKEYS SOURCE DESTINATIONS

    SSHKEYS        Path to auth ssh keys
    SOURCE         Path to watch source
    DESTINATIONS   Path to destination on server
    
    EOF
}

sync() {
    rsync -aWHvz --delete -e "ssh -i $SSHKEYS" $SOURCE $DESTINATIONS
}

if [ "$1" != "" ]; then
  SSHKEYS=$1
fi

if [ "$2" != "" ]; then
  SOURCE=$2
fi

if [ "$3" != "" ]; then
  DESTINATIONS=$3
fi

# Check exist sshkey
if [ "$SSHKEYS" = "" ]; then
  usage
  exit 1
fi

# Run
echo Running watch files over SSH Tunnel
sync
