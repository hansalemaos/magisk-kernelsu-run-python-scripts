#!/system/bin/sh
mysu="$(which su)"
pyfile="/sdcard/hansgisk/pythonscript.py"
termuxhome=/data/data/com.termux/files/home
termuxhomebash=/data/data/com.termux/files/home/.bashrc
pythonpath=/data/data/com.termux/files/usr/bin/python
termuxbash="/data/data/com.termux/files/usr/bin/bash"
oldpath="$PATH"
MODDIR=${0%/*}
while [ "$(getprop sys.boot_completed)" != 1 ]; do
    sleep 1
done
while [ ! -d "/sdcard" ] ; do
    sleep 3
done
if [ ! -f "$pyfile" ]; then
    exit 0
fi
mount -o remount,rw /
cd "$termuxhome"
source "$termuxhomebash"
export PATH="$PATH:$oldpath:/data/data/com.termux/files/usr/bin:/data/data/com.termux/files/home"
loopforever="$(cat "$pyfile" | grep -o 'LOOP_FOREVER')"
if [ -n "$loopforever" ]; then
    while true; do
        exec "$mysu" -s "$termuxbash" --preserve-environment --mount-master -c "$pythonpath $pyfile"
    done
else
    exec "$mysu" -s "$termuxbash" --preserve-environment --mount-master -c "$pythonpath $pyfile"
fi
