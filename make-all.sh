#!/bin/bash
# used with .bashrc alias make-all='make clean && reset && ./scripts/make-all.sh'
# For official builds on all my devices

root=/media/thomas/Dev/BrokenOs

$root/build-broken.sh -c10 -p -a -j10 shamu
$root/build-broken.sh -c10 -p -a -j10 hammerhead
$root/build-broken.sh -c10 -p -a -j10 flo 
