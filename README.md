# zram
Script to dynamically enable ZRAM on a Linux system. Forked from https://github.com/novaspirit/rpi_zram

# how to install
Download install.sh, uninstall.sh, zram.sh. chmod +x install.sh. Run install.sh as root.
Edit /usr/bin/zram.sh string $totalmem * 128, set to desired value.
systemctl start zram.service
