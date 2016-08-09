#!/bin/bash
# used with .bashrc alias hh='reset && ./scripts/hammerhead.sh'

OPTIND=1
root=~/BrokenOs

while getopts "clean:dirty:official:kernel:" opt; do
    case "$opt" in
    c) $root/build-broken.sh -c1 -p -a -j18 hammerhead ;;
    d) $root/build-broken.sh -c2 -p -a -j18 hammerhead ;;
    o) $root/build-broken.sh -c10 -p -a -j18 hammerhead ;;
    k) source $root/build/envsetup.sh
	lunch broken_hammerhead-userdebug
		make bootzip -j18;exit ;;
    esac
done

shift $((OPTIND-1))
