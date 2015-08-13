#!/usr/bin/env bash
# DESCRIPTION:
#   Used to install common packages on all vm images

PACKAGES="ntp bind-utils wget nfs-utils autofs bzip2 unzip mlocate yum-utils yum-plugin-remove-with-leaves deltarpm epel-release"
yum install -y $PACKAGES
