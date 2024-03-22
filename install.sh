installer=
[ -f /bin/yay ] && installer=yay
[ -f /bin/paru ] && installer=paru

[ -z installer ] && {
	echo "make sure yay or paru is installed"
	exit 1
}

echo "Installing deps"
sudo pacman -S i3-wm picom dunst polybar xss-lock xfce4-power-manager mpd feh i3lock rofi alacritty conky uthash meson base-devel cmake ninja python-pywal
${installer} -S light xfce-polkit

# making picom
cd /tmp
git clone https://github.com/pijulius/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
ninja -C build install
