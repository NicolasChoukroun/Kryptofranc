
Debian
====================
This directory contains files used to package kryptofrancd/kryptofranc-qt
for Debian-based Linux systems. If you compile kryptofrancd/kryptofranc-qt yourself, there are some useful files here.

## kryptofranc: URI support ##


kryptofranc-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install kryptofranc-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your kryptofranc-qt binary to `/usr/bin`
and the `../../share/pixmaps/kryptofranc128.png` to `/usr/share/pixmaps`

kryptofranc-qt.protocol (KDE)

