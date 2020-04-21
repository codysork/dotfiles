#!/bin/bash

GPU=$(optimus-manager --status | grep "Current GPU" | sed 's/^.*: / /g')

echo "$GPU"

