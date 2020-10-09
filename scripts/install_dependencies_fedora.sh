#!/bin/bash

echo "installing depndencies needed to run kickstart tests"
sudo dnf install libguestfs-tools virt-install lorax-lmc-virt parallel python3-libvirt python3-rpmfluff
echo "done"
