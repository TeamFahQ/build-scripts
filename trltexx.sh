#!/bin/bash
# used with .bashrc alias g4='reset && ./scripts/trltexx.sh'

OPTIND=1
root=$PWD
init= source build/envsetup.sh; lunch broken_trltexx-userdebug
rom='-p -a -j8 trltexx'
out='out/target/product/trltexx'
kernel='make bootimage -j18'

while getopts "clean:dirty:official:kernel:sync" opt; do
    case "$opt" in
    c) date;$root/build-broken.sh -c1 $rom; exit;;
    d) date;cd $out
	rm -fR *.zip *.md5sum *.img *.id *.cpio
	cd -
	$root/build-broken.sh -c $rom; exit;;
    o) date;$root/build-broken.sh -c10 $rom; exit ;;
    k) date;$root; $init; $kernel;exit ;;
    s) date;repo sync -j4 --force-sync;exit ;;
    esac
done

shift $((OPTIND-1))
