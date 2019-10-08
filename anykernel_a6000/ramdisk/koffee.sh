#!/system/bin/sh
# Koffee's (now Infernal's) startup script
# running immediatelly after mounting /system
# do not edit!

mkdir /dev/bfqio
/sbin/busybox mount -t cgroup none /dev/bfqio -o bfqio
sleep 1
mkdir /dev/bfqio/rt-display
chmod 0664 /dev/bfqio/*
chmod 0220 /dev/bfqio/cgroup.event_control
chmod 0664 /dev/bfqio/rt-display/*
chmod 0755 /dev/bfqio
chmod 0755 /dev/bfqio/rt-display
chmod 0220 /dev/bfqio/rt-display/cgroup.event_control
chown -R root:system /dev/bfqio

echo 1 > /dev/bfqio/rt-display/bfqio.ioprio_class

mkdir -m 0777 /data/ureadahead
/sbin/ureadahead --daemon --timeout=90
exit 0