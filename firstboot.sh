#!/bin/sh
# Let us take control of this // wuseman

switch2jffs_hook=
jffs2reset_hook=
no_fo_hook=

. /lib/functions/boot.sh

firstboot_skip_next=true

for fb_source_file in /lib/firstboot/*; do
    . $fb_source_file
done

set_mtd_part
set_rom_part
set_jffs_part

# invoked as an executable
if [ "${0##*/}" = "firstboot" ]; then
    if [ "$1" = "switch2jffs" ]; then
        boot_run_hook switch2jffs
    elif [ -n "$jffs" ]; then
        reset_has_fo=false
        echo "firstboot has already been run"
        echo "jffs2 partition is mounted, only resetting files"
        boot_run_hook jffs2reset
    else
        mount "$mtdpart" /overlay -t jffs2
        fopivot /overlay /rom 0
    fi
fi
