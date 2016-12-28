#!/bin/bash
# used with .bashrc alias g4='reset && ./scripts/athene.sh'

OPTIND=1
root=/media/thomas/Dev/BrokenOs

while getopts "clean:dirty:quick:official:kernel:" opt; do
    case "$opt" in
    c) date;$root/build-broken.sh -c1 -p -a -j18 athene; exit;;
    d) date;$root/build-broken.sh -c -p -a -j18 athene; exit;;
    q) date;$root/build-broken.sh -c14 -p -a -j18 athene; exit;;
    o) date;$root/build-broken.sh -c10 -p -a -j18 athene; exit ;;
    k) date;source $root/build/envsetup.sh;
	lunch broken_athene-userdebug;
		make bootimage -j18;exit ;;
    esac
done

shift $((OPTIND-1))
