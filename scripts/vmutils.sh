#!/usr/bin/env bash
# DESCRIPTION:
#   Used to set up hypervisor-specific virtualisation tools and utilites on the guest.

# If a ISO directory isn't defined, revert to default
VM_ISO=${VM_ISO:-~/vmutils.iso}

# Mount VM utilities ISO and complete run tasks
case $PACKER_BUILDER_TYPE in

  virtualbox-iso)
  echo "Install VM utilites for VirtualBox"
  yum install -e 0 -y gcc dkms patch kernel-devel kernel-headers 2>&1 > /dev/null
  mount -o loop ${VM_ISO} /mnt
  echo "Run Guest Additions installer"
  /mnt/VBoxLinuxAdditions.run
  echo "Remove unneccessary packages"
  yum remove -y gcc dkms patch kernel-devel kernel-headers 2>&1 > /dev/null
  # Cleaning up
  umount /mnt
  rm -f ${VM_ISO}
  ;;

  amazon-ebs)
  echo "Updating system for AWS"
  yum update -y
  echo "Switching to GB encoding"
  localectl set-locale LANG=en_GB.utf8
  ;;

  *)
  echo "No VM utilites installation specified for this build type"
  ;;

esac

echo "VM utilities installed"
exit 0
