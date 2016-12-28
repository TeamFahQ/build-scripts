#!/bin/bash
# used with .bashrc alias n6='reset && ./scripts/shamu.sh'

OPTIND=1
root=/media/thomas/Dev/BrokenOs

while getopts "clean:dirty:quick:official:kernel:" opt; do
    case "$opt" in
    c) date;$root/build-broken.sh -c1 -p -a -j18 shamu; exit;;
    d) date;$root/build-broken.sh -c -p -a -j18 shamu; exit;;
    q) date;$root/build-broken.sh -c14 -p -a -j18 shamu; exit;;
    o) date;$root/build-broken.sh -c10 -p -a -j18 shamu; exit ;;
    k) date;source $root/build/envsetup.sh;
	lunch broken_shamu-userdebug;
		make bootimage -j18;exit ;;
    esac
done

shift $((OPTIND-1))
