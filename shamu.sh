#!/bin/bash
# used with .bashrc alias n6='reset && ./scripts/shamu.sh'

OPTIND=1
root=/media/thomas/Dev/BrokenOs

while getopts "clean:dirty:official:kernel:" opt; do
    case "$opt" in
    c) $root/build-broken.sh -c1 -p -a -j10 shamu && exit;;
    d) $root/build-broken.sh -c2 -p -a -j10 shamu && exit;;
    o) $root/build-broken.sh -c10 -p -a -j10 shamu && exit ;;
    k) source $root/build/envsetup.sh && lunch broken_shamu-userdebug && make bootimage -j12 ;;
    esac
done

shift $((OPTIND-1))
