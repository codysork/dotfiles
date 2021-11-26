#!/bin/bash

GPU=$(optimus-manager --status | grep "Current GPU" | sed 's/^.*: //g'| cut -c -2)

echo ${GPU}
