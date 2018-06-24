#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ `type -P xbindkeys` ]; then
    xbindkeys
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export TERMINAL=kitty
setxkbmap -option ctrl:nocaps
setxkbmap -option terminate:ctrl_alt_bksp
setxkbmap -option shift:both_capslock
xinput --set-prop 12 'libinput Accel Speed' -0.5
~/.fehbg &
udiskie --no-automount --tray --use-udisks2 &

exec i3
