#!/bin/bash
# used with .bashrc alias n6='reset && ./scripts/shamu.sh'

OPTIND=1
root=$PWD
init= source build/envsetup.sh; lunch broken_shamu-userdebug
rom='-p -a -j8 shamu'
kernel='make bootimage -j18'

while getopts "clean:dirty:official:kernel:sync" opt; do
    case "$opt" in
    c) date;$root/build-broken.sh -c1 $rom; exit;;
    d) date;$root/build-broken.sh -c $rom; exit;;
    o) date;$root/build-broken.sh -c10 $rom; exit ;;
    k) date;$root; $init; $kernel;exit ;;
    s) date;repo sync -j4 --force-sync;exit ;;
    esac
done

shift $((OPTIND-1))
