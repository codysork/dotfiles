#!/bin/sh

totals=$(hamster list | tail -n 2)

echo " $totals"
