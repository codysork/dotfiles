#!/bin/bash

TOUCHPAD_STATE=$(xinput | grep -i touchpad)

echo $TOUCHPAD_STATE
