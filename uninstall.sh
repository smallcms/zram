#!/bin/bash

systemctl stop zram.service
systemctl disable zram.service
rm -rf /etc/systemd/system/zram.service
rm -rf /usr/bin/zram.sh
