#!/usr/bin/env bash
# DESCRIPTION:
#   Used to install Puppet into a build.
#
# USAGE:
#   Set PUPPET_VERSION to specific version of Puppet if desired.

PUPPET_VERSION=${PUPPET_VERSION:-latest}

# Download upstream Puppet repository
rpm -i http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

case $PUPPET_VERSION in
  latest) yum install -e 0 -y puppet 2>&1 > /dev/null
         ;;
       *) yum install -e 0 -y "puppet-$(PUPPET_VERSION)"
         ;;
esac
