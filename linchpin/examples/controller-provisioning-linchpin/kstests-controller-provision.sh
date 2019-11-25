#!/bin/bash

# Inventory for ansible will be generated by linchpin based on PinFile layout configuration
INVENTORY=linchpin/inventories/kstest-controller.inventory

linchpin -v --workspace linchpin -p examples/controller-provisioning-linchpin/PinFile.controller -c linchpin/linchpin.conf up kstest-controller

cat <<EOF >> ${INVENTORY}
[all:vars]
ansible_ssh_user=fedora
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
#ansible_ssh_private_key_file=<PRIVATE_KEY_PATH>
ansible_python_interpreter=/usr/bin/python3

[kstest-controller:vars]
kstest_controller_user_authorized_key="<PUBLIC_KEY_PATH>"
#cloud_config_file=<CLOUD_CONFIG_FILE>
#private_keys_to_upload='["<PRIVATE_KEY_TO_UPLOAD_PATH>"]'
#public_keys_to_upload='["<PUBLIC_KEY_TO_UPLOAD_PATH>"]'
EOF