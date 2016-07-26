#!/bin/bash
# used with .bashrc alias flo='reset && ./scripts/flo.sh'

OPTIND=1
root=~/BrokenOs

while getopts "clean:dirty:official:kernel:" opt; do
    case "$opt" in
    c) $root/build-broken.sh -c1 -p -a -j10 flo ;;
    d) $root/build-broken.sh -c2 -p -a -j10 flo ;;
    o) $root/build-broken.sh -c10 -p -a -j10 flo ;;
    k) source $root/build/envsetup.sh && lunch broken_flo-userdebug && make bootimage -j12 ;;
    esac
done

shift $((OPTIND-1))
