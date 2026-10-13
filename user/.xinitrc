LETTER=$(echo $((RANDOM % 6 + 65)) | awk '{printf "%c", $1}')
~/Scripts/generateColors.sh "$LETTER"

~/Scripts/wallLoop.sh "$LETTER" &
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# fixes my silly keyboard layout
picom --config ~/.config/picom/picom.conf &
redshift -P -O 4200 &
sudo light -S 3 &
dwmbar &
exec dwm 
