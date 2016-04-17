#!/bin/bash
# used with .bashrc alias hh='reset && ./scripts/hammerhead.sh'

OPTIND=1
root=/media/thomas/Development/BrokenOs

while getopts "clean dirty official kernal:" opt; do
    case "$opt" in
    c) $root/build-broken.sh -c1 -p -a -j8 hammerhead ;;
    d) $root/build-broken.sh -c2 -p -a -j10 hammerhead ;;
    o) $root/build-broken.sh -c10 -p -a -j10 hammerhead ;;
    k) source $root/build/envsetup.sh && lunch broken_hammerhead-userdebug && make bootimage -j12 ;;
    esac
done

shift $((OPTIND-1))
