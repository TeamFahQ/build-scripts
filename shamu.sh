#!/bin/bash
# used with .bashrc alias n6='reset && ./scripts/shamu.sh'

OPTIND=1
root=/media/thomas/Dev/BrokenOs
init= source build/envsetup.sh; lunch broken_shamu-userdebug
rom='-p -a -j18 shamu'
kernel='make bootimage -j18'

while getopts "clean:dirty:quick:official:kernel:" opt; do
    case "$opt" in
    c) date;$root/build-broken.sh -c1 $rom; exit;;
    d) date;$root/build-broken.sh -c $rom; exit;;
    q) date;$root/build-broken.sh -c14 $rom; exit;;
    o) date;$root/build-broken.sh -c10 $rom; exit ;;
    k) date;$root; $init; $kernel;exit ;;
    esac
done

shift $((OPTIND-1))
