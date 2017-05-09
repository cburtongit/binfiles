#!/bin/bash

#
# Backup list installed package
#

dnf list installed | awk '{print $1}' > package_list.txt
