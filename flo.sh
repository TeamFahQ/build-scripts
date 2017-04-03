#!/bin/bash
# used with .bashrc alias flo='reset && ./scripts/flo.sh'

OPTIND=1
root=$PWD
init= source build/envsetup.sh; breakfast aquarios_flo-userdebug
rom='make bacon -j10'
kernel='make bootimage -j18'

while getopts "clean:dirty:official:kernel:sync" opt; do
    case "$opt" in
    c) date;$init && make clean && reset && $rom; exit;;
    d) date;$init && $rom; exit;;
    o) date;echo wip; exit ;;
    k) date;$root; $init; $kernel;exit ;;
    s) date;repo sync -j4 --force-sync && reset;exit ;;
    esac
done

shift $((OPTIND-1))
