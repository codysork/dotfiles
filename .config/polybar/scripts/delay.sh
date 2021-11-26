#!/bin/bash

DELAY=$(cat /etc/delayed-admin/delay.conf)
LOCK_STATUS=""
USER="cody"
UNDELAYED_SUDO_ACCESS=$(sudo -l | grep '(ALL) ALL')

if ! [[ $UNDELAYED_SUDO_ACCESS ]]; then
  LOCK_STATUS=""
fi

echo "$LOCK_STATUS $DELAY seconds"
