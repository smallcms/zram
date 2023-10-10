#!/bin/bash

#Copy the script and copy to /usr/bin/ folder
BASEDIR=$(dirname $0)
cp $BASEDIR/zram.sh /usr/bin/zram.sh

#make file executable
chmod +x /usr/bin/zram.sh

#add systemd service
tee /etc/systemd/system/zram.service <<-'EOF'
[Unit]
Description=zram Service
;After=network-online.target
;Wants=network-online.target systemd-networkd-wait-online.service

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/bin/bash /usr/bin/zram.sh
ExecStop=/bin/bash /usr/bin/zram.sh stop
OOMScoreAdjust=-1000

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable zram.service
systemctl start zram.service
