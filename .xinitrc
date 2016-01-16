# Setup encoding
export LANG=en_AU.UTF-8

# Disable mouse acceleration
xset m 1/1 1

# Silence system bell
xset b 0

# Background
feh --bg-tile ~/backgrounds/px.png &

# i-Bus
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="xim"
export XMODIFIERS="@im=ibus"
exec ibus-daemon --daemonize --xim &


#/usr/local/bin/spectrwm
exec startfluxbox
#startxfce4
#exec wmaker

#/usr/local/bin/fvwm2
#/usr/local/bin/i3
