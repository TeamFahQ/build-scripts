#!/bin/bash
# used with .bashrc alias flo='reset && ./scripts/flo.sh'

OPTIND=1
root=$PWD
init= source build/envsetup.sh; breakfast aquarios_flo-userdebug
rom='make bacon -j10'
kernel='make bootimage -j18'
clean='make clean -j36'
clr='reset'
prnt='echo -e \033[1mOut with the trash\033[0m'

while getopts "clean:dirty:official:kernel:sync" opt; do
    case "$opt" in
    c) $init; $clean; $clr; $prnt; $rom;exit;;
    d) $init; $rom; exit;;
    o) echo wip; exit ;;
    k) $root; $init; $kernel;exit ;;
    s) repo sync -j4 --force-sync; $clr;exit ;;
    esac
done

shift $((OPTIND-1))
