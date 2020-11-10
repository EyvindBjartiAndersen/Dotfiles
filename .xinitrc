# keyboard
setxkbmap us colemak "ctrl:nocaps,shift:both_capslock"
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xcape -e 'Control_L=Escape'
xset r rate 150 150
xset s off

# setup
xrdb -merge .Xresources
xrandr --dpi 157

# apps
~/.fehbg &
pulseaudio -D
picom&
xbanish&
wal -R&
slstatus&

# scripts
disabletouchpad&
updmirrors&

# loop dwm so it restarts when killed
while true; do
    # Log stderror to a file 
    dwm 2> ~/.dwm.log
    # No error logging
    #dwm >/dev/null 2>&1
done
